from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'my_blog.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^ckeditor/', include('ckeditor.urls')),
    url(r'^$', 'article.views.home', name='home'),
    url(r'^hello/$', 'article.views.hello'),
    url(r'^detail/(?P<id>\d+)/$', 'article.views.detail', name='detail'),
    url(r'^test_template/$', 'article.views.test_template'),
)
