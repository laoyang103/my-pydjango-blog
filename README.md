基于Django个人博客
=========================

#概述
基于  Django1.8  和  Django-Ckeditor  开发的 博客系统 ，实现了一个博客完整的功能。
http://nafei.sinaapp.com/

#安装运行
安装virtualenv :

    sudo pip install virtualenv

创建并激活虚拟环境 :

    cd my-pydjango-blog
    virtualenv www
    source www/bin/activate

安装依赖 :

    pip install -r requirements.txt

初始化数据库 :

    python manage.py makemigrations
    python manage.py migrate
    python manage.py createsuperuser
    
运行 :
    
    python manage.py runserver

在浏览器中输入 http://127.0.0.1:8000/admin  
输入前面初始化数据库时的用户名密码。
