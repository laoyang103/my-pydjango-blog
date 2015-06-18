from django.db import models

# Create your models here.
class Article(models.Model):
    title 	    = models.CharField(max_length=100)
    category 	= models.CharField(max_length=100, blank=True)
    data_time 	= models.DateTimeField(auto_now_add=True)
    context 	= models.TextField(blank=True)

    def __str__(self):
        return self.title

