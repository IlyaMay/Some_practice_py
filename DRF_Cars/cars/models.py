from datetime import datetime
from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class CarList(models.Model):
    time_create = models.DateTimeField(auto_now_add=True)
    car_name = models.CharField(max_length=30, blank=False)
    review = models.TextField(max_length=400, blank=False)
    year = models.PositiveIntegerField(validators=[MinValueValidator(1900),
            MaxValueValidator(datetime.now().year)], help_text="Use the following format: <YYYY>")
    image = models.ImageField(upload_to='images/%Y/%m/%d/', null=True, blank=True, verbose_name='Изображение')
    owner = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    category = models.ForeignKey('Category', on_delete=models.PROTECT, null=True)

    def __str__(self):
        return self.car_name

    class Meta:
        ordering = ['time_create']
        verbose_name = 'Статью'
        verbose_name_plural = 'Публикации'


class Category(models.Model):
    cat_name = models.CharField(max_length=20, blank=False)

    def __str__(self):
        return self.cat_name

    class Meta:
        verbose_name = 'Категории'
        verbose_name_plural = 'Тип кузова'


class Comment(models.Model):
    time_create = models.DateTimeField(auto_now_add=True)
    comment = models.TextField(blank=False)
    owner = models.ForeignKey('auth.User', related_name='comments', on_delete=models.CASCADE)
    post = models.ForeignKey('CarList', related_name='comments', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.owner)

    class Meta:
        ordering = ['time_create']
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'


