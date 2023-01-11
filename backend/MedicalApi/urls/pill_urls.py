from django.urls import path
from MedicalApi.views import pill_views as views


urlpatterns = [

    path('', views.getPills, name="pills"),
    path('all', views.getPillls, name="Allpills"),

    path('create/', views.addPill, name="pill-create"),
    path('<str:pk>/', views.getPill, name="pill"),

    path('update/<str:pk>/', views.updatePill, name="pill-update"),
    path('delete/<str:pk>/', views.deletePill, name="pill-delete"),
]