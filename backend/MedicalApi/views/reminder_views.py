from django.shortcuts import render
#django rest framework makes our api more and more powerfull
#we must add djangorestframework to our installed apps if we wanna use it
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from MedicalApi.models import Pill, Reminder
from MedicalApi.serializers import PillSerializer , ReminderSerializer
from rest_framework import status


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getReminders(request):
    user = request.user
    reminders = user.reminder_set.all()
    serializer = ReminderSerializer(reminders, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([IsAdminUser])
def getAllReminders(request):
    reminders = Reminder.objects.all()
    serializer = ReminderSerializer(reminders, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getReminderByDay(request, pk):

    user = request.user
    reminderss=[]

    try:
        reminders = user.reminder_set.all()
        for i in reminders :
            if str(pk) in str(i.days_Key):
                reminderss.append(i)
        if  (reminderss != []):      
            serializer = ReminderSerializer(reminderss, many=True)
            return Response(serializer.data)
        else :
           return  Response({'detail': 'Reminder does not exist'},
                     status=status.HTTP_400_BAD_REQUEST)
    except:
        return Response({'detail': 'Reminder does not exist'}, status=status.HTTP_400_BAD_REQUEST)    



@api_view(['POST'])
@permission_classes([IsAuthenticated])
def addReminder(request):
    user = request.user
    data = request.data
    reminder = Reminder.objects.create(
            user = user, 
            pill = Pill.objects.get(_id=data['pill']),
            days_Key = str(data['days_Key']),
            isRepeated = bool(data['isRepeated']),
            isDeactivated = bool(data['isDeactivated']),
            pickedTime = data['pickedTime']
        )    
    serializer = ReminderSerializer(reminder, many=False)
    return Response(serializer.data)


@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def updateReminder(request, pk):
    data = request.data
    reminder = Reminder.objects.get(_id=pk)

    reminder.pill = data['pill']
    reminder.days_Key = data['days_Key']
    reminder.isRepeated = data['isRepeated']
    reminder.isDeactivated = data['isDeactivated']
    reminder.pickedTime = data['pickedTime']
    
    reminder.save()

    serializer = ReminderSerializer(reminder, many=False)
    return Response(serializer.data)



@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def deleteReminder(request, pk):
    reminder = Reminder.objects.get(_id=pk)
    reminder.delete()
    return Response('Reminder Deleted')