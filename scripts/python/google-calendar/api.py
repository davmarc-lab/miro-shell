import requests
from caltypes import Event
from client import AuthClient
from exception import AuthFailedException, RequestFailedException


class CalendarAPI:
    def __init__(self):
        self.__client = AuthClient()

    def health(self):
        try:
            auth_token = self.__client.auth(
                "https://www.googleapis.com/auth/calendar.readonly"
            )
        except AuthFailedException as e:
            print(f"Auth failed with error: {e}")
            return False

        return len(auth_token) > 0

    def getAllEvents(self, calendar_id: str):
        scope = "https://www.googleapis.com/auth/calendar.readonly"

        access_token = self.__client.auth(scope)

        url = f"https://www.googleapis.com/calendar/v3/calendars/{calendar_id}/events"
        headers = {"Authorization": f"Bearer {access_token}"}

        print(f"Fetching events for calendar: {calendar_id}...")

        all_events = []
        page_token = None

        while True:
            params = {}
            if page_token:
                params["pageToken"] = page_token

            response = requests.get(url, headers=headers, params=params)

            if response.status_code != 200:
                raise RequestFailedException(response.text, response.status_code)

            data = response.json()
            items = data.get("items", [])
            all_events.extend(items)

            # Scroll pages
            page_token = data.get("nextPageToken")
            if not page_token:
                break

        return all_events

    def insertEvent(self, event: Event):
        # get auth token
        # prepare event
        # call inser event api
        # return response status code
        pass
