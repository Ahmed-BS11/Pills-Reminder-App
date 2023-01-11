from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import User
from .models import Pill,  Reminder



class PillSerializer(serializers.ModelSerializer):

         class Meta:
            model = Pill
            fields = '__all__'



            

class UserSerializer(serializers.ModelSerializer):
         name = serializers.SerializerMethodField(read_only=True)
         _id = serializers.SerializerMethodField(read_only=True)
         isAdmin = serializers.SerializerMethodField(read_only=True)
         class Meta:
            model = User
            fields = ['id','_id','username' , 'name', 'email' ,'isAdmin']
         def get__id(self, obj):
            return obj.id

         def get_isAdmin(self, obj):
            return obj.is_staff

         def get_name(self, obj):
             name = obj.first_name
             if name == '':
              name = obj.email

             return name            



class UserSerializerWithToken(UserSerializer):
    token = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = User
        fields = ['id', '_id', 'username', 'email', 'name', 'isAdmin', 'token']

    def get_token(self, obj):
        token = RefreshToken.for_user(obj)
        return str(token.access_token)




class ReminderSerializer(serializers.ModelSerializer):

    pill = serializers.SerializerMethodField(read_only=True)
    user = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Reminder
        fields = '__all__'

    def get_pill(self, obj):
        pill_items = obj.pill
        serializer = PillSerializer(pill_items, many=False)
        return serializer.data
    def get_user(self, obj):
        user = obj.user
        serializer = UserSerializer(user, many=False)
        return serializer.data        



