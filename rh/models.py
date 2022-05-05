from django.db import models

# Create your models here.


class Departamento(models.Model):
    nome = models.CharField(max_length=200)


class Colaborador(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    nome = models.CharField(max_length=200)
    salario = models.DecimalField(decimal_places=2, max_digits=10)

