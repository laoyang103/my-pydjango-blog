from django.shortcuts import render
from django.http import HttpResponse
from article.models import Article

# Create your views here.
def home(request):
    return HttpResponse('Hello Django')
    
def detail(request, num):
    art = Article.objects.all()[int(num)]
    return HttpResponse(art)
