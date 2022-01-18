
from django.contrib import admin
from django.urls import path


from githubActionTestApp.views import *

app_name = 'mainapp'

urlpatterns = [
    path('', main, name='main'),

]
