import os
import sys

from api import CalendarAPI
from dotenv.main import load_dotenv

if __name__ == "__main__":
    KEY_FILE = "google-key.json"
    load_dotenv()

    CALENDAR_ID = os.getenv("GOOGLE_EMAIL") or ""
    if not CALENDAR_ID:
        print("Google Calendar email not found")
        sys.exit(1)

    api = CalendarAPI()
    if not api.health():
        print("Google Auth Failed")
        del api
        sys.exit(2)
    print("CalendarAPI auth OK")

    try:
        events = api.getAllEvents(CALENDAR_ID)
        print(f"\nSuccessfully retrieved a total of {len(events)} events:\n")
        for event in events:
            start = event.get("start", {}).get(
                "dateTime", event.get("start", {}).get("date")
            )
            summary = event.get("summary", "No Title")
            print(f"- [{start}] {summary}")
    except Exception as e:
        print(f"An error occurred: {e}")

    del api
