class NotImplementedException(Exception):
    def __init__(self, method_name=""):
        self.message = (
            f"Method '{method_name}' not implemented"
            if method_name
            else "Method not implemented"
        )
        super().__init__(self.message)

    def __str__(self):
        return f"{self.message}"


class AuthFailedException(Exception):
    def __init__(self, message=""):
        self.message = message if message else "Authentication failed"
        super().__init__(self.message)

    def __str__(self):
        return f"{self.message}"


class RequestFailedException(Exception):
    def __init__(self, text="", code=-1):
        self.message = (
            ("Request Failed" + f" (ERROR {code})" if code > 0 else "")
            + (":\n--- RESPONSE ---\n" + text if text else "Bad Request")
            + "--- END ---"
        )
        super().__init__(self.message)

    def __str__(self):
        return f"{self.message}"
