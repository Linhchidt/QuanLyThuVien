from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager
from .enums import *

app = Flask(__name__)
app.secret_key = "\xec\xc1\xa1\xe0\x82\x84\xb6\xd3xZ\xf0/\xce2d\xcc"
app.config["SQLALCHEMY_DATABASE_URI"] ="mysql+pymysql://root:123456@localhost/thuvien?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
db = SQLAlchemy(app)

login = LoginManager(app=app)
admin = Admin(app=app, name="Quản Lý Thư Viện", template_mode="bootstrap3")



