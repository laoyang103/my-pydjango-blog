from django.shortcuts import render
from django.db.models import Count
from django.http import HttpResponse, Http404
from article.models import Article
from datetime import datetime
from my_blog import settings

# Create your views here.
def home(request):
    art = Article.objects.order_by('-datetime')[:5:]
    categorys = Article.objects.values('category').annotate(dcount=Count('category'))
    return render(request, 'home.html', {'artlist': art, 'categorys': categorys, 'next_page': 2})

def list(request, page, cate):
    page = int(page)
    start = settings.PRE_PAGE_NUM * (page - 1)
    end = settings.PRE_PAGE_NUM * page

    # find artlist
    if '' == cate:
        art = Article.objects.order_by('-datetime')[start:end:]
    else:
        art = Article.objects.filter(category=cate).order_by('-datetime')[start:end:]
    # statistics categorys
    categorys = Article.objects.values('category').annotate(dcount=Count('category'))

    resdict = {'artlist': art, 'categorys': categorys}
    if cate: resdict['cate'] = cate
    if 0 != len(art): resdict['next_page'] = page + 1
    if 1 < page: resdict['pre_page'] = page - 1
    return render(request, 'home.html', resdict)

def detail(request, id):
    try:
        art = Article.objects.get(id=str(id))
    except Article.DoesNotExist:
        raise Http404
    categorys = Article.objects.values('category').annotate(dcount=Count('category'))
    return render(request, 'detail.html', {'art': art, 'categorys': categorys})
