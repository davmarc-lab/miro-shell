import json
import time

import requests
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives.serialization import load_pem_private_key
from exception import AuthFailedException
from utils import base64url_encode, read_key_from_env


class AuthClient:
    def __init__(self):
        self.__key_data = read_key_from_env()
        self.__is_authenticated = False
        self.__token = ""

    def auth(self, scope: str, force=False) -> str:
        if self.__is_authenticated and not force:
            return self.__token

        print("Generating access token via direct JWT signing...")
        client_email = self.__key_data["client_email"]
        private_key_pem = self.__key_data["private_key"]
        token_uri = self.__key_data["token_uri"]

        now = int(time.time())

        # Construct JWT Header and Claims (Payload)
        header = {"alg": "RS256", "typ": "JWT"}
        payload = {
            "iss": client_email,
            "scope": scope,
            "aud": token_uri,
            "exp": now + 3600,
            "iat": now,
        }

        # Serialize and Base64Url encode header and payload
        encoded_header = base64url_encode(
            json.dumps(header, separators=(",", ":")).encode("utf-8")
        )
        encoded_payload = base64url_encode(
            json.dumps(payload, separators=(",", ":")).encode("utf-8")
        )

        signing_input = f"{encoded_header}.{encoded_payload}".encode()

        # Sign the input using the RSA private key from key.json
        private_key = load_pem_private_key(
            private_key_pem.encode("utf-8"), password=None
        )
        signature = private_key.sign(signing_input, padding.PKCS1v15(), hashes.SHA256())  # pyright: ignore[reportAttributeAccessIssue, reportCallIssue]
        encoded_signature = base64url_encode(signature)

        jwt_assertion = f"{signing_input.decode('utf-8')}.{encoded_signature}"

        # Exchange JWT assertion for an OAuth 2.0 Access Token
        token_response = requests.post(
            token_uri,
            data={
                "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer",
                "assertion": jwt_assertion,
            },
        )

        if token_response.status_code != 200:
            raise AuthFailedException(
                f"Failed to obtain access token: {token_response.text}"
            )

        self.__is_authenticated = True
        self.__token = token_response.json()["access_token"]

        return self.__token
