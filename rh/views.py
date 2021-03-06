from datetime import datetime
from django.shortcuts import render
from django.http import JsonResponse

import pprint
from pymongo import MongoClient
import redis

def index(request):
    return render(request, 'index.html')

def ponto_mongo(request):
    
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'

    if is_ajax:
        try:
            ponto = { 
                "colaborador" : {
                    "id" : 25.0, 
                    "nome" : "Fulano", 
                    "idade" : 32.0, 
                    "cargo" : {
                        "id" : 33.0, 
                        "cargo" : "Desenvolvedor", 
                        "departamento" : "Informatica"
                    }
                }, 
                "data" : "2022-06-02", 
                "ponto" : [
                    {
                        "tipo" : "entrada", 
                        "hora" : "08:10:49.689"
                    }, 
                    {
                        "tipo" : "saida", 
                        "hora" : "12:15:49.689"
                    }, 
                    {
                        "tipo" : "entrada", 
                        "hora" : "13:00:49.689"
                    }, 
                    {
                        "tipo" : "saida", 
                        "hora" : "18:50:49.689"
                    }
                ], 
                "jornada" : 8.75
            }
            
            client = MongoClient('mongodb+srv://mongo:mongo@cluster0.vrxu3.mongodb.net/?retryWrites=true&w=majority')
        
            db = client.rh
            print('db', db)
            print(db.list_collection_names())
            
            pontos = db.ponto
            ponto_id = pontos.insert_one(ponto).inserted_id
            ponto_id
                
        except:
            return JsonResponse({'response': 'Invalid request'}, status=400)
        
    else:
        return JsonResponse({'response': 'Invalid request'}, status=400)
    
    return JsonResponse({'response': f'Ponto {ponto_id} registrado com sucesso'}, )


def ponto_redis(request):
    print(request)
    
    try:    
        r = redis.Redis(
            host='redis-17597.c52.us-east-1-4.ec2.cloud.redislabs.com',
            port=17597, 
            password='7CIPeS4zNspIUXCCAJBCuFfBTwyDfH58')
        
        print('opa', r)

        chave = f'henrique-{datetime.now().strftime("%d%m%Y%S")}'
        print(chave)
        r.set(chave, str(datetime.now()))
        
        value = r.get(chave)
        print(value)
            
    except:
        return JsonResponse({'response': 'Invalid request'}, status=400)
        
    
    return JsonResponse({'response': f'ponto {chave} : {value}'}, )