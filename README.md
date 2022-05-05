# senai-pos-edia-rhtech

## 1- Creating a project
        django-admin startproject mysite
        python manage.py runserver

## 2- Creating the RH app
        python manage.py startapp rh

### First view 
### mapping route        

## 3- Database setup

## 4- Timezone setup

## 5- Run migrate
        python manage.py migrate

- erro 'psycopg2' 
        
        pip install psycopg2-binary

## 6- Creating models

## 7- Activating models
        python manage.py makemigrations rh

### Show DDL
        python manage.py sqlmigrate rh 0001

### Apply migrate
        python manage.py migrate

## 8- Django Admin
        python manage.py createsuperuser

## 9- Make the rh app modifiable in the admin
        admin.site.register(Colaborador)


## 10- Activating SQL logs