import markdown
from django import template
from django.template.defaultfilters import stringfilter
from django.utils.safestring import mark_safe

register = template.Library() 

@register.filter(is_safe=True)
@stringfilter
def custom_markdown(value):
    res = markdown.markdown(value, extensions = ['markdown.extensions.codehilite'])
    # must call mark_safe, otherwise it not work. 
    # The follow is code "print 'hello'"'s result:
    # With mark_safe will send this to brower: 
    #     <div class="codehilite"><pre><span class="k">print</span> <span class="s">&#39;hello&#39;
    #     </span></pre></div>
    # Otherwise: 
    #     &lt;div class=&quot;codehilite&quot;&gt;&lt;pre&gt;&lt;span class=&quot;k&quot;&gt;print&lt;/
    #     span&gt; &lt;span class=&quot;s&quot;&gt;&amp;#39;hello&amp;#39;&lt;/span&gt;
    return mark_safe(res)
