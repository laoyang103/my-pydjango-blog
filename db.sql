PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2015-06-21 10:35:47.520770');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2015-06-21 10:35:47.596535');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2015-06-21 10:35:47.668853');
INSERT INTO "django_migrations" VALUES(4,'article','0001_initial','2015-06-21 10:35:47.708750');
INSERT INTO "django_migrations" VALUES(5,'article','0002_auto_20150621_1035','2015-06-21 10:35:47.785943');
INSERT INTO "django_migrations" VALUES(6,'sessions','0001_initial','2015-06-21 10:35:47.832667');
INSERT INTO "django_migrations" VALUES(7,'article','0002_auto_20150622_0247','2015-06-22 02:47:42.255487');
INSERT INTO "django_migrations" VALUES(8,'article','0003_auto_20150622_0728','2015-06-22 07:28:52.920086');
INSERT INTO "django_migrations" VALUES(9,'article','0004_auto_20150622_0737','2015-06-22 07:37:56.620532');
INSERT INTO "django_migrations" VALUES(10,'article','0005_auto_20150622_0737','2015-06-22 07:38:00.137662');
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL, UNIQUE ("app_label", "model"));
INSERT INTO "django_content_type" VALUES(1,'log entry','admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'permission','auth','permission');
INSERT INTO "django_content_type" VALUES(3,'group','auth','group');
INSERT INTO "django_content_type" VALUES(4,'user','auth','user');
INSERT INTO "django_content_type" VALUES(5,'content type','contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'session','sessions','session');
INSERT INTO "django_content_type" VALUES(7,'article','article','article');
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, UNIQUE ("content_type_id", "codename"));
INSERT INTO "auth_permission" VALUES(1,'Can add log entry',1,'add_logentry');
INSERT INTO "auth_permission" VALUES(2,'Can change log entry',1,'change_logentry');
INSERT INTO "auth_permission" VALUES(3,'Can delete log entry',1,'delete_logentry');
INSERT INTO "auth_permission" VALUES(4,'Can add permission',2,'add_permission');
INSERT INTO "auth_permission" VALUES(5,'Can change permission',2,'change_permission');
INSERT INTO "auth_permission" VALUES(6,'Can delete permission',2,'delete_permission');
INSERT INTO "auth_permission" VALUES(7,'Can add group',3,'add_group');
INSERT INTO "auth_permission" VALUES(8,'Can change group',3,'change_group');
INSERT INTO "auth_permission" VALUES(9,'Can delete group',3,'delete_group');
INSERT INTO "auth_permission" VALUES(10,'Can add user',4,'add_user');
INSERT INTO "auth_permission" VALUES(11,'Can change user',4,'change_user');
INSERT INTO "auth_permission" VALUES(12,'Can delete user',4,'delete_user');
INSERT INTO "auth_permission" VALUES(13,'Can add content type',5,'add_contenttype');
INSERT INTO "auth_permission" VALUES(14,'Can change content type',5,'change_contenttype');
INSERT INTO "auth_permission" VALUES(15,'Can delete content type',5,'delete_contenttype');
INSERT INTO "auth_permission" VALUES(16,'Can add session',6,'add_session');
INSERT INTO "auth_permission" VALUES(17,'Can change session',6,'change_session');
INSERT INTO "auth_permission" VALUES(18,'Can delete session',6,'delete_session');
INSERT INTO "auth_permission" VALUES(19,'Can add article',7,'add_article');
INSERT INTO "auth_permission" VALUES(20,'Can change article',7,'change_article');
INSERT INTO "auth_permission" VALUES(21,'Can delete article',7,'delete_article');
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"), UNIQUE ("group_id", "permission_id"));
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NOT NULL, "is_superuser" bool NOT NULL, "username" varchar(30) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(75) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$15000$KBduDSklXQNM$V/UN0Gj4D7oyUYhVZYkwzQR3XdwrMFDGsEZfbSKLQcM=','2015-06-22 02:48:53.737060',1,'admin','','','q@q.com',1,1,'2015-06-21 10:36:19.387065');
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), UNIQUE ("user_id", "group_id"));
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"), UNIQUE ("user_id", "permission_id"));
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"));
INSERT INTO "django_admin_log" VALUES(1,'2015-06-21 10:36:54.563638','1','No Title',1,'',7,1);
INSERT INTO "django_admin_log" VALUES(2,'2015-06-22 02:49:16.735590','1','No Title',2,'Changed content.',7,1);
INSERT INTO "django_admin_log" VALUES(3,'2015-06-22 04:19:17.756480','2','No Title',1,'',7,1);
INSERT INTO "django_admin_log" VALUES(4,'2015-06-22 04:19:39.445360','2','python mod create',2,'Changed title and category.',7,1);
INSERT INTO "django_admin_log" VALUES(5,'2015-06-22 04:21:26.457207','2','python mod create',2,'Changed content.',7,1);
INSERT INTO "django_admin_log" VALUES(6,'2015-06-22 04:22:05.445874','2','python mod create',2,'Changed content.',7,1);
INSERT INTO "django_admin_log" VALUES(7,'2015-06-22 07:03:32.515144','1','AxBmodM',2,'Changed title, category and content.',7,1);
INSERT INTO "django_admin_log" VALUES(8,'2015-06-22 08:02:46.057704','2','python mod create',2,'Changed summary.',7,1);
INSERT INTO "django_admin_log" VALUES(9,'2015-06-22 08:06:35.299496','2','python mod create',2,'Changed content.',7,1);
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('nswrv4ewxhkpxah634w22puo6tq25fpo','YjQ0MTQ4MmEzNzdlZjFlZTg0YjBkYWRiZjNjZmJmZGE3YjVkMTA2MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzE5MGE0ZGViOGU0NzQ0Njg5ZDAzZmVlYjMxNWY5OTRkNzAxMzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-05 10:36:33.105534');
INSERT INTO "django_session" VALUES('z54r1cj6u4luka7yx975r5uuoohjcmpt','YjQ0MTQ4MmEzNzdlZjFlZTg0YjBkYWRiZjNjZmJmZGE3YjVkMTA2MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4MzE5MGE0ZGViOGU0NzQ0Njg5ZDAzZmVlYjMxNWY5OTRkNzAxMzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-07-06 02:48:53.755008');
CREATE TABLE "article_article" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "datetime" datetime NOT NULL, "title" varchar(100) NOT NULL, "category" varchar(100) NOT NULL, "author" varchar(100) NOT NULL, "content" text NOT NULL, "summary" text NOT NULL);
INSERT INTO "article_article" VALUES(1,'2015-06-22 02:47:33.566617','AxBmodM','C','admin','<p>context</p>

<pre>
<code class="language-C">#include &lt;stdio.h&gt;

long long AxBmodM(long long a, long long b, long long m)
{
    long long r;
    for (r = 0; b; b &gt;&gt;= 3, a = (a &lt;&lt; 3) % m) {
        if (b &amp; 7) r = (r + a * (b &amp; 7)) % m;
    }
    return r;
}

int main() 
{
    printf("%lld\n", AxBmodM(2147483647, 2147483647, 5));
    printf("%lld\n", AxBmodM(2147483648, 2147483648, 3));
    return 0;
}
</code></pre>

<p>&nbsp;</p>
','summary');
INSERT INTO "article_article" VALUES(2,'2015-06-22 04:19:17.754948','python mod create','qwe','admin','<h1><span style="color:#FF0000"><strong><span style="font-size:14px"><span style="background-color:#00FF00">http://192.168.1.72/admin/article/article/2/</span></span></strong></span></h1>

<hr />
<p><img alt="heart" src="http://192.168.1.72/static/ckeditor/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /><img alt="heart" src="http://192.168.1.72/static/ckeditor/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /></p>

<hr />
<p><img alt="" src="/static/uploads/2015/06/22/5-120601015i6-50.gif" style="background-color:rgb(255, 255, 255); color:rgb(51, 51, 51); cursor:default; font-family:sans-serif,arial,verdana,trebuchet ms; font-size:13px; height:153px; line-height:20.7999992370605px; width:159px" /></p>

<hr />
<pre>
<code class="language-Python">from django.contrib import admin
from article.models import Article

# Register your models here.
admin.site.register(Article)
root@ipmos-72:/home/laoyang/workspace/my-pydjango-blog/article# cat models.py
from django.db import models
from django.core.urlresolvers import reverse
from datetime import datetime
from ckeditor.fields import RichTextField

# Create your models here.
class Article(models.Model):
    title 	    = models.CharField(max_length=100, default=''No Title'')
    author      = models.CharField(max_length=100, default=''admin'')
    category 	= models.CharField(max_length=100, blank=True, default=''No Category'')
    datetime 	= models.DateTimeField(auto_now_add=True, default=datetime.now())
    content 	= RichTextField(''content'', default=''context'')

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        path = reverse(''detail'', kwargs={''id'': self.id})
        return ''http://192.168.1.71%s'' % path
</code></pre>

<p>&nbsp;</p>
','<p>summary</p>

<p><img alt="" src="/static/uploads/2015/06/22/5-120601015i6-50.gif" style="height:153px; width:159px" /></p>
');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('django_content_type',7);
INSERT INTO "sqlite_sequence" VALUES('django_migrations',10);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',21);
INSERT INTO "sqlite_sequence" VALUES('auth_user',1);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',9);
INSERT INTO "sqlite_sequence" VALUES('article_article',2);
CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" ("content_type_id");
CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log" ("user_id");
CREATE INDEX "django_session_de54fa62" ON "django_session" ("expire_date");
COMMIT;
