from django.db import models
from django.core.urlresolvers import reverse

# Create your models here.
class Article(models.Model):
    title 	    = models.CharField(max_length=100)
    author      = models.CharField(max_length=100)
    category 	= models.CharField(max_length=100, blank=True)
    datetime 	= models.DateTimeField(auto_now_add=True)
    content 	= models.TextField(blank=True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        path = reverse('detail', kwargs={'id': self.id})
        return 'http://192.168.1.71%s' % path
