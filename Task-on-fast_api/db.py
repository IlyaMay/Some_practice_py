from bson import ObjectId
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client['Products']
collection = db['products_collection']

def create_new(product_data: dict) -> dict:
    product = collection.insert_one(product_data)
    new_product = collection.find_one({'_id': product.inserted_id})
    return new_product

def product_id(id: str) -> dict:
    if ObjectId.is_valid(id):
        product = collection.find_one({'_id': ObjectId(id)})
        return product
    else:
        return {'error': 'Не правильно указан ID'}

def list_products(params: dict):
    products = []
    query = {}

    for product in collection.find(query, {"name": 1, "_id": 0}):
        products.append(product)

    return products
