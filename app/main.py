from app import app, login,dao
from flask import render_template, redirect,request
from flask_login import login_user, login_required

from app.admin import *


@app.route('/')
def index():
    books = dao.getBookList()
    return render_template('index.html', books=books)


@app.route("/register")
def register():
    err_msg = ""
    if request.method == "POST":
        name = request.form.get("name")
        username = request.form.get("username")
        password = request.form.get("password")
        confirm = request.form.get("confirm")
        if password.strip() != confirm.strip():
            err_msg = "The password does not match!"

    return render_template("register.html", err_msg=err_msg)


@app.route("/loginuser")
def loginuser():
    err_msg = ""
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        password = hashlib.md5(password.strip().encode("utf-8")).hexdigest()
        user = NhanVien.query.filter(NhanVien.username == username.strip(), NhanVien.password == password.strip()).first()
        if user:
                login_user(user=user)
        else:
            err_msg = "DANG NHAP KHONG THANH CONG"

    return render_template("loginuser.html", err_msg=err_msg)


@app.route("/login-admin", methods=["post", "get"])
def login_admin():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        password = hashlib.md5(password.strip().encode("utf-8")).hexdigest()
        user = NhanVien.query.filter(NhanVien.taiKhoan == username.strip(), NhanVien.matKhau == password.strip()).first()
        if user:
            login_user(user=user)
    return redirect("/admin")


@app.route("/products")
def products():
    books = dao.getBookList()
    return render_template("base/products.html",books=books)


@app.route("/contact")
def contact():
    return render_template("base/contact.html")


@app.route("/about")
def about():
    return render_template("base/about.html")


@app.route("/single-product")
def single_product():
    books = dao.getBookList()
    return render_template("base/single-product.html",books=books)


@login.user_loader
def user_load(taikhoan):
    return NhanVien.query.filter(NhanVien.taiKhoan == taikhoan).first()

# @app.context_processor
# def commond_data():
#     return{
#         ''
#     }


if __name__ == '__main__':
    app.run(debug=True)
