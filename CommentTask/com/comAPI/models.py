from django.db import models
from mptt.models import MPTTModel
from mptt.fields import TreeForeignKey

class Post(models.Model):
    time_created = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=100, blank=True)
    text = models.TextField(blank=True)
    owner = models.ForeignKey('auth.User', related_name='posts', on_delete=models.CASCADE)
    category = models.ManyToManyField('Category', related_name='categories', blank=True)

    class Meta:
        verbose_name = "Пост"
        verbose_name_plural = "Посты"
        ordering = ['-time_created']

    def __str__(self):
        return f"{self.title}"


class Comment(MPTTModel):
    time_created = models.DateTimeField(auto_now_add=True)
    text = models.TextField(blank=True)
    post = models.ForeignKey('Post', related_name='comments', on_delete=models.CASCADE)
    parent = TreeForeignKey('self', on_delete=models.CASCADE,
        blank=True, null=True, related_name='children',
        verbose_name='Комментарий')
    answer = models.ForeignKey('auth.User', null=True, blank=True,
                               on_delete=models.CASCADE, related_name='repliers')

    class Meta:
        verbose_name = "Комментарий"
        verbose_name_plural = "Комментарии"
    class MPTTMeta:
        ordering = ['-time_created']

    def __str__(self):
        return f'{self.text} -> {self.parent}'


class Category(models.Model):
    title = models.CharField(max_length=100, blank=False, default='')
    posts = models.ManyToManyField('Post', related_name='categories', blank=True)

    class Meta:
        verbose_name_plural = 'Категории'


    def __str__(self):
        return f'{self.title}'

    
