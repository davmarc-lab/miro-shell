import os
import sys

from api import CalendarAPI
from caltypes import Event, EventDate, Reminder
from dotenv.main import load_dotenv
from exception import RequestFailedException

if __name__ == "__main__":
    # Serialize in JSON format
    # overrides = [
    #     ReminderOverride(method=OverrideMethodType.POPUP, minutes=15),
    #     ReminderOverride(method=OverrideMethodType.EMAIL, minutes=60),
    # ]
    # reminder_config = Reminder(overrides=overrides, default=False)

    # event = Event(
    #     summary="Team Sync Meeting",
    #     description="Discussing weekly goals and project updates.",
    #     reminders=reminder_config
    # )

    # serialized_event = event.serialize()
    # json_output = json.dumps(serialized_event, indent=4)
    # print(json_output)

    # if not os.path.exists(".env"):
    #     print("environment file missing")
    #     sys.exit(1)

    # KEY_FILE = "google-key.json"
    # load_dotenv()

    # CALENDAR_ID = os.getenv("GOOGLE_EMAIL") or ""
    # if not CALENDAR_ID:
    #     print("Google Calendar email not found")
    #     sys.exit(2)

    api = CalendarAPI()
    # if not api.health():
    #     print("Google Auth Failed")
    #     del api
    #     sys.exit(3)
    # print("CalendarAPI auth OK")

    # try:
    #     events = api.getAllEvents(CALENDAR_ID)
    #     print(f"Found: {len(events)}")
    # except RequestFailedException as e:
    #     print(e)

    start = EventDate()
    end = EventDate()
    summary = "Test Events"
    description = "Sample event"

    event = Event(start, end, summary=summary, description=description)
    api.insertEvent(event, "primary")


    # del api
