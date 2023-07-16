import os
import sqlite3

from flask import Flask, render_template, request, g, flash, redirect, url_for
from flask_login import LoginManager, login_user, login_required, logout_user, current_user
from werkzeug.security import generate_password_hash, check_password_hash

from DABASE import DABASE
from UserLogin import UserLogin

app = Flask(__name__)
app.config.from_object(__name__)
app.config.update(dict(DATABASE=os.path.join(app.root_path, 'otzvsite.db')))
app.secret_key = "super secret key"

login_manager = LoginManager(app)

DEBUG = True
SECRET_KEY = 'dadada33'
USERNAME = 'admin'
PASSWORD = '123123'


@login_manager.user_loader
def load_user(user_id):
    print("load_user")
    return UserLogin().fromDB(user_id, dbase)


def connect_db():
    conn = sqlite3.connect(app.config['DATABASE'])
    conn.row_factory = sqlite3.Row
    return conn


def create_db():
    db = connect_db()
    with app.open_resource('sq_db.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()
    db.close()


def get_db():
    # Соединение с БД
    if not hasattr(g, 'link_db'):
        g.link_db = connect_db()
    return g.link_db


dbase = None

@app.before_request
def before_request():
    # Установление соединения с БД перед выполнением запроса
    global dbase
    db = get_db()
    dbase = DABASE(db)


@app.teardown_appcontext
def close_db(error):
    # Закрываем соединение с БД
    if hasattr(g, 'link_db'):
        g.link_db.close()


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/Отзывы", methods=["POST", "GET"])
def add_otzv():
    if request.method == "POST":
        if len(request.form['name']) > 4 and len(request.form['otvz']) > 4:
            res = dbase.add_otzv(request.form['name'], request.form['otvz'])
            if not res:
                flash('Ошибка добавления отзыва', category='error')
            else:
                flash('Ваш отзыв добавлен успешно', category='success')
        else:
            flash('Ошибка добавления', category='error')

    return render_template('Otziv.html', otzvs=dbase.get_otvz_Anonce())


@app.route("/register", methods=["POST", "GET"])
def register():
    if request.method == "POST":
        if len(request.form['name']) > 3 and len(request.form['email']) > 3 \
                and len(request.form['psw']) > 3 and request.form['psw'] == request.form['psw2']:
            hash = generate_password_hash(request.form['psw'])
            res = dbase.addUser(request.form['name'], request.form['email'], hash)
            if res:
                flash("Вы успешно зарегистрированы", "success")
                return redirect(url_for('login'))
            else:
                flash("Ошибка при добавлении в БД", "error")
        else:
            flash("Неверно заполнены поля", "error")

    return render_template("register.html")


@app.route("/login", methods=["POST", "GET"])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('profile'))

    if request.method == "POST":
        user = dbase.getUserByEmail(request.form['email'])
        if user and check_password_hash(user['psw'], request.form['psw']):
            userlogin = UserLogin().create(user)
            login_user(userlogin)
            return redirect(request.args.get("index") or url_for("profile"))

        flash("Неверная пара логин/пароль", "error")

    return render_template("login.html")


@app.route('/profile')
@login_required
def profile():
    return f"""<a href="{url_for('logout')}">Выйти из профиля</a>
                <br>
                Ваш ID: {current_user.get_id()}
"""


@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Вы вышли из аккаунта", "success")
    return redirect(url_for('login'))


@app.route("/Школьная форма")
def forma():
    return render_template('forma.html')


@app.route("/Форма для мальчиков")
def form_boy():
    return render_template('form-men.html')


@app.route("/Форма для девочек")
def form_girl():
    return render_template('form-girl.html')


@app.route("/СССP")
def form_cccp():
    return render_template('form-CCCP.html')


@app.route("/Трикотаж")
def form_tric():
    return render_template('form-trik.html')


@app.route("/Хор")
def hor():
    return render_template('hor.html')


@app.route("/Портфели")
def port():
    return render_template('portfeli.html')


@app.route("/Контакты")
def contact():
    return render_template('сontact.html')


@app.route("/О нас")
def dostavka():
    return render_template('О-nas.html')


@app.route("/Карнавальные костюмы")
def karnaval():
    return render_template('karnaval.html')


@app.route("/для мальчиков")
def karnaval_boy():
    return render_template('karnaval-boy.html')


@app.route("/для девочек")
def karnaval_girl():
    return render_template('karnaval-girl.html')


@app.route("/фрукты")
def karnaval_frukt():
    return render_template('karnaval-frukt.html')


@app.route("/звери")
def zveri():
    return render_template('karnaval-zveri.html')


if __name__ == '__main__':
    app.run(debug=True)
