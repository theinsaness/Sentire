from datetime import datetime
from typing import Optional
from pydantic import BaseModel

class Entrada(BaseModel):
    texto: str
    fecha: Optional[datetime] = None
