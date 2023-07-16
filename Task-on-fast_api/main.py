from fastapi import FastAPI, Request
from fastapi.encoders import jsonable_encoder
from models import *
from db import *
import uvicorn as u
app = FastAPI()

@app.get("/")
def read_root():
    return {"Добрый день"}

@app.get('/product/{product_id}')
async def get_item(product_id: str):
    return product_id

@app.get('/products_list')
async def get_items(request: Request):
    return list_products(dict(request.query_params))

@app.post('/add_product')
async def add_item(product: Product):
    new_product = create_new(jsonable_encoder(product))
    return {"ID": str(new_product["_id"])}


if __name__ == '__main__':
    u.run(app, host="127.0.0.1", port=8000,)

