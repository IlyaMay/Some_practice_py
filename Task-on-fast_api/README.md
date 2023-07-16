### Описание:
---
Микросервис для электронного магазина.
Проект выполнен на базе Fastapi, MongoDB.

### Инструкция:
В файле ***requirements.txt*** указаны все необходимые бибилотеки для работы приложения.
Для установки библиотек воспользуйтесь командой:
```sh
pip install -r requirements.txt
```
Для запуска приложения необходимо перейти в каталог проекта, где находится файл main.py, и выполнить следующую команду:
```sh
uvicorn app:app --reload
```
### Пример curl команд
---
Вывод всей коллекции из базы:
```sh
curl -X 'GET' \'http://127.0.0.1:8000/products_list' \-H 'accept: application/json'
```
Получение товара по ID:
```sh
curl -X GET "http://127.0.0.1:8000/item/?id=value" -H  "accept: application/json"
```
Создание товара:
```sh
curl -X 'POST' \'http://127.0.0.1:8000/add_product' \-H 'accept: application/json' \-H 'Content-Type: application/json' \-d '{"name": "telefon","price": 1111,"parameters": [{"resolution": "1520x520"},{"camera": "12+3+2"},{"memory": "64"},]}'
```
Также дополнительную документацию можно найти:
```sh
http://127.0.0.1:8000/docs
http://127.0.0.1:8000/redoc
```
