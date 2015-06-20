from markdown import markdown
from django.shortcuts import render
from django.http import HttpResponse, Http404
from article.models import Article
from datetime import datetime

# Create your views here.
def hello(request):
    return HttpResponse('Hello Django')

def test_template(request):
    return render(request, 'test.html', {'curr_time': datetime.now()})

def home(request):
    art = Article.objects.all()
    return render(request, 'home.html', {'artlist': art})

def detail(request, id):
    try:
        art = Article.objects.get(id=str(id))
    except Article.DoesNotExist:
        raise Http404
    return render(request, 'detail.html', {'art': art})
