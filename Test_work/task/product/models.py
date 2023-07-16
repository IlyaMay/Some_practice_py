from django.db import models

class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30,blank=False)
    price = models.IntegerField()
    description = models.TextField(blank=False)
    parameters = models.JSONField(blank=True)

    def __str__(self):
        return f'ID {self.id}: {self.name}'

    class Meta:
        verbose_name_plural = 'Товары'
        verbose_name = 'Товар'
        ordering = ['id', 'name']


