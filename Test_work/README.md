### Описание:
---
Микросервис для электронного магазина.

Проект выполнен на базе Django, Django Rest Framework, MongoDB.

### Инструкция:
В файле ***requirements.txt*** указаны все необходимые бибилотеки для работы приложения.
Для установки библиотек воспользуйтесь командой:
```sh
pip install -r requirements.txt
```
Для запуска приложения необходимо перейти в каталог проекта, где находится файл manage.py, и выполнить следующую команду:
```sh
python manage.py runserver
```
### Пример curl команд
---
Вывод всей коллекции из базы:
```sh
curl -X GET 'http://127.0.0.1:8000/product/'
```
Создание объектов:
```sh
curl -X POST 'http://127.0.0.1:8000/api/product/' -H 'Accept: application/json' -H 'Content-Type: application/json' --data-raw '
{"name": "name","description": "description","parameters": {"param1": "value","param2": "value2","param3": "value3"}}'
```
Получение товара:
1)по ID
```sh
curl -X GET 'http://127.0.0.1:8000/api/product/?id=value' -H 'Accept: application/json'
```
2)по названию
```sh
curl -X GET 'http://127.0.0.1:8000/api/product/?name=value' -H 'Accept: application/json'
```
