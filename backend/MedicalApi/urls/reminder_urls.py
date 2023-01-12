from django.urls import path
from MedicalApi.views import reminder_views as views


urlpatterns = [
    path('create/', views.addReminder, name="reminder-create"),
    path('', views.getReminders, name="Allreminders"),

    path('<str:pk>/', views.getReminderByDay, name="reminders"),
    path('update/<str:pk>/', views.updateReminder, name="reminder-update"),
    path('delete/<str:pk>/', views.deleteReminder, name="reminder-delete"),
]