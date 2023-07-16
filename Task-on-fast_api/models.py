from typing import List
from pydantic import BaseModel

class Product(BaseModel):
    name: str
    price: int
    parameters: List[dict] = []
