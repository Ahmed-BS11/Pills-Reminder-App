from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
# Create your views here.



@api_view(['GET'])
#we pass a list of the methods we can allaw
def getUsers(request):
    messageee = ['user1','user2','user3']
    return Response(messageee)
@api_view(['GET'])
def getUser(request,pk):
    messageee = ['user1','user2','user3']
    return Response(messageee[int(pk)-1])    