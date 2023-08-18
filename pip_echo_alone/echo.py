# Expects JSON like {"message": "hello"}
# Returns "hello"
import msgspec

class EventStruct(msgspec.Struct):
    message: str

def handler(raw_event, context):
    return msgspec.convert(raw_event, EventStruct).message
