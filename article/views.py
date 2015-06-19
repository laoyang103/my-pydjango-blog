from django.shortcuts import render
from django.http import HttpResponse
from article.models import Article
from datetime import datetime

# Create your views here.
def hello(request):
    return HttpResponse('Hello Django')
    
def detail(request, num):
    art = Article.objects.all()[int(num)]
    return HttpResponse(art)

def test_template(request):
    return render(request, 'test.html', {'curr_time': datetime.now()})

def home(request):
    art = Article.objects.all()
    return render(request, 'home.html', {'artlist': art})
