from django.urls import path
from MedicalApi.views import user_views as views
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
)

urlpatterns = [
    path('login/', views.MyTokenObtainPairView.as_view(),
         name='token_obtain_pair'),

    path('register/', views.registerUser, name='register'),
    path('profiles/', views.getUsers, name='register'),
    path('profile/', views.getUserProfile, name="users-profile"),
    path('profile/update/', views.updateUserProfile, name="user-profile-update"),
    path('', views.getUsers, name="users"),

    path('update/<str:pk>/', views.updateUserProfile, name='user-update'),

    path('delete/<str:pk>/', views.deleteUser, name='user-delete'),
    #path('a',views.getUsers,name='test_api'),
    #path('auser/<str:pk>/',views.getUser,name='test_apii'),
]    
