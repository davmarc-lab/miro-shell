from collections.abc import Mapping
from datetime import date, datetime
from enum import Enum
from pydoc import doc


class ISerializable:
    def __init__(self):
        pass

    def serialize(self) -> Mapping[str, object]:
        raise NotImplementedError("serialize()")


class OverrideMethodType(Enum):
    EMAIL = "email"
    POPUP = "popup"
    DEFAULT = POPUP

    def serialize(self) -> Mapping[str, object]:
        return {"method": self.value}


class ReminderOverride(ISerializable):
    method: OverrideMethodType
    minutes: int

    def __init__(
        self, method: OverrideMethodType = OverrideMethodType.POPUP, minutes: int = 60
    ):
        self.method = method
        self.minutes = minutes

    def serialize(self) -> Mapping[str, object]:
        return {
            "method": self.method.value,
            "minutes": self.minutes,
        }


class Reminder(ISerializable):
    overrides: list[ReminderOverride]
    default: bool

    def __init__(self, overrides: list[ReminderOverride] | None = None, default=False):
        self.overrides = overrides if overrides is not None else []
        self.default = default

    def serialize(self) -> Mapping[str, object]:
        return {
            "useDefault": self.default,
            "overrides": [elem.serialize() for elem in self.overrides],
        }


class EventType(Enum):
    BIRTHDAY = "birthday"
    DEFAULT = "default"
    FOCUS_TIME = "focusTime"
    FROM_GMAIL = "fromGmail"
    OUT_OF_OFFICE = "outOfOffice"
    WORKING_LOCATION = "workingLocation"

    def serialize(self) -> Mapping[str, object]:
        return {"type": self.value}


class EventDate(ISerializable):
    date: date
    date_time: datetime

    def __init__(self, current: datetime | None = None):
        current = (
            current.astimezone() if current is not None else datetime.now().astimezone()
        )
        self.date_time = current
        self.date = current.date()

    def serialize(self) -> Mapping[str, object]:
        return {
            "date": self.date.strftime("%Y-%m-%d"),
            "dateTime": self.date_time.isoformat(),
        }


class Event:
    start: EventDate
    end: EventDate
    summary: str
    description: str
    location: str
    color_id: str | None

    type: EventType | None

    reminders: Reminder

    def __init__(
        self,
        start: EventDate | None = None,
        end: EventDate | None = None,
        location: str = "",
        summary: str = "Empty Title",
        description: str = "",
        color_id: str | None = None,
        event_type: EventType | None = None,
        reminders: Reminder | None = None,
    ):
        self.start = start or EventDate()
        self.end = end or EventDate()
        self.location = location
        self.summary = summary
        self.description = description
        self.color_id = color_id
        self.event_type = event_type
        self.reminders = reminders or Reminder()

    def serialize(self):
        return {
            "start": self.start.serialize(),
            "end": self.end.serialize(),
            "location": self.location,
            "summary": self.summary,
            "description": self.description,
            "color_id": self.color_id,
            "eventType": self.event_type,
            "reminders": self.reminders.serialize(),
        }
