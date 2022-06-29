from django.urls import path
from . import views

urlpatterns = [
    path('', views.getRoutes, name='routes'),
    path('courses/', views.getCourses, name='courses'),
    path('courses/<str:sl>', views.getCourse, name='course'),
    path('fcourses/', views.postCourses, name='fcourses'),
]
