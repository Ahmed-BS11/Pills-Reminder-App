from django.db import models

# Create your models here.
from django.contrib.auth.models import User

class Pill(models.Model): #the param we passed will turn pur class into model
      user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)#it means we dont have to delete the child element when the parent gets deleted
      #..and the second one means that we dont allaw the attribute to be null
      name = models.CharField(max_length=200, null=True, blank=True)#blank means we can fill out form and we dont have to have this element completed
      dose = models.IntegerField(null=True, blank=True, default=1)
      id_Shape = models.IntegerField(null=True, blank=True, default=0)
      description = models.TextField(null=True, blank=True)
      refillOn = models.IntegerField(null=False, blank=True, default=1)
      createdAt = models.DateTimeField(auto_now_add=True)
      _id = models.AutoField(primary_key=True, editable=False)

      def __str__(self):
           return self.name       



class Reminder(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    pill = models.ForeignKey(Pill, on_delete=models.SET_NULL, null=True)
    days_Key = models.CharField(max_length=8, null=True, blank=True)
    isRepeated = models.BooleanField(default=False)
    isDeactivated = models.BooleanField(default=False)
    pickedTime = models.TimeField()
    createdAT = models.DateTimeField(auto_now_add=True, null=True, blank=True)  
    _id = models.AutoField(primary_key=True, editable=False)  

    def __str__(self):
        return str(self.createdAT)