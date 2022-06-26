from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('ponto_mongo', views.ponto_mongo),
    path('ponto_redis', views.ponto_redis),
]


