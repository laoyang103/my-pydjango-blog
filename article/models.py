from django.db import models
from django.core.urlresolvers import reverse
from datetime import datetime
from ckeditor.fields import RichTextField

# Create your models here.
class Article(models.Model):
    title 	    = models.CharField(max_length=100, default='No Title')
    author      = models.CharField(max_length=100, default='admin')
    category 	= models.CharField(max_length=100, blank=True, default='No Category')
    datetime 	= models.DateTimeField(auto_now_add=True, default=datetime.now())
    content 	= RichTextField('content', default='context')

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        path = reverse('detail', kwargs={'id': self.id})
        return 'http://192.168.1.71%s' % path
