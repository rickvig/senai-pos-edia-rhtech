# Generated by Django 4.0.4 on 2022-05-05 04:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Departamento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Colaborador',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=200)),
                ('salario', models.DecimalField(decimal_places=2, max_digits=10)),
                ('departamento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rh.departamento')),
            ],
        ),
    ]
