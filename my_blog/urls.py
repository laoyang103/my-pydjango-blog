from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'my_blog.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^ckeditor/', include('ckeditor.urls')),
    url(r'^$', 'article.views.home', name='home'),
    url(r'^list/(?P<page>\d+)_(?P<cate>.*)/$', 'article.views.list', name='list'),
    url(r'^detail/(?P<id>\d+)/$', 'article.views.detail', name='detail'),
)
