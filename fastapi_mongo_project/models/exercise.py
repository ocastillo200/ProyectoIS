from typing import Optional
from pydantic import BaseModel

class Exercise(BaseModel):
    name: str
    preset: Optional[str]
    reps: Optional[int]
    duration: Optional[int]
    weight: Optional[int]
    machine: Optional[str]
