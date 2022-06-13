from django.shortcuts import render
from django.http import HttpResponse

import pprint
from pymongo import MongoClient

def index(request):
    
    return HttpResponse("<h1>Ola RH-TECH</h1>")

def ponto(request):
    
    # client = MongoClient('mongodb+srv://mongo:mongo@cluster0.atpofno.mongodb.net/?retryWrites=true&w=majority')
    client = MongoClient('mongodb+srv://mongo:mongo@cluster0.vrxu3.mongodb.net/?retryWrites=true&w=majority')
    
    db = client.rh
    print('db', db)
    print(db.list_collection_names())
    
    pontos = db.ponto
    
    pprint.pprint(pontos.find_one())
    
    
    ''' pq não está achando?'''
    pprint.pprint(pontos.find_one({"colaborador.nome": "Lorena Vignando"}))

        
    cursor = pontos.find({});
    
    
    
    # for idx in pontos:
    #     print(cursor[idx])
    
    context = {
            'mensagem': 'Petshop',
            'usuario': request.user.username
            }
    return render(request, 'index.html', context)
    
    # return HttpResponse("<h1>Ponto registrado</h1>")