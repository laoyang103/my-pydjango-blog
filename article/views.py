from django.shortcuts import render
from django.http import HttpResponse, Http404
from article.models import Article
from datetime import datetime
from my_blog import settings

# Create your views here.
def home(request):
    art = Article.objects.order_by('-datetime')[:5:]
    return render(request, 'home.html', {'artlist': art, 'netx_page': 2})

def list(request, page):
    page = int(page)
    start = settings.PRE_PAGE_NUM * (page - 1)
    end = settings.PRE_PAGE_NUM * page
    art = Article.objects.order_by('-datetime')[start:end:]
    return render(request, 'home.html', {'artlist': art, 'netx_page': page + 1})

def detail(request, id):
    try:
        art = Article.objects.get(id=str(id))
    except Article.DoesNotExist:
        raise Http404
    return render(request, 'detail.html', {'art': art})
