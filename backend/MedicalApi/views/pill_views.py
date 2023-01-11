from django.shortcuts import render
#django rest framework makes our api more and more powerfull
#we must add djangorestframework to our installed apps if we wanna use it
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from MedicalApi.models import Pill 
from MedicalApi.serializers import PillSerializer
from rest_framework import status


@api_view(['GET'])
def getAllPills(request) :
    pills = Pill.objects.all()
    serializeredPills = PillSerializer(pills, many=True)
    return Response(serializeredPills.data)  



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getPills(request) :
    user = request.user
    pills = user.pill_set.all()
    serializer = PillSerializer(pills, many=True)
    return Response(serializer.data)    


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getPillls(request) :
    pills = Pill.objects.all()
    serializeredPills = PillSerializer(pills, many=True)
    return Response(serializeredPills.data) 

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getPill(request, pk) :
    pill= Pill.objects.get(_id=pk)
    serPill = PillSerializer(pill, many=False)
    return Response(serPill.data)  



@api_view(['POST'])
@permission_classes([IsAuthenticated])
def addPill(request):
    user = request.user
    data = request.data
    pill = Pill.objects.create(
         user=user,
         name=data['name'],
         dose=data['dose'],
         id_Shape=data['id_Shape'],
         description=data['description'],
         refillOn=data['refillOn']
        )    
    serializer = PillSerializer(pill, many=False)
    return Response(serializer.data)    


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def updatePill(request, pk):
    data = request.data
    pill = Pill.objects.get(_id=pk)

    pill.name = data['name']
    pill.dose = data['dose']
    pill.id_Shape = data['id_Shape']
    pill.description = data['description']
    pill.refillOn = data['refillOn']
    
    pill.save()

    serializer = PillSerializer(pill, many=False)
    return Response(serializer.data)




@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def deletePill(request, pk):
    pill = Pill.objects.get(_id=pk)
    pill.delete()
    return Response('Pill Deleted')
