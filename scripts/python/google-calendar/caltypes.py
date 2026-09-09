from collections.abc import Mapping
from datetime import date, datetime
from enum import Enum


class ISerializable:
    """Interface to serialize/deserialize data"""

    def __init__(self):
        pass

    def deserialize(self) -> Mapping[str, object]:
        """Deserializes a dictionary in raw data.
        This method deserializes a dictionary into raw data.

        Returns:
        """
        raise NotImplementedError("deserialize()")

    def serialize(self) -> Mapping[str, object]:
        """Serialize raw data.
        This method serializes raw data into a dictionary.

        Returns:
            dict[str, object]: the serialized data
        """
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

    def getValue(self) -> str:
        return self.value

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
        self.event_type = event_type if event_type else EventType.DEFAULT
        self.reminders = reminders or Reminder()

    def serialize(self):
        return {
            "start": self.start.serialize(),
            "end": self.end.serialize(),
            "location": self.location,
            "summary": self.summary,
            "description": self.description,
            "color_id": self.color_id,
            "eventType": self.event_type.getValue(),
            "reminders": self.reminders.serialize(),
        }

    def __str__(self):
        return self.serialize().__str__()


class CreateEventOpts:
    def __init__(self, args):
        pass
