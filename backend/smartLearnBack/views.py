# from itertools import course
# from pickle import TRUE
# from django.shortcuts import render
# from django.http import JsonResponse
from .models import Course
from .models import FutureCourse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import CourseSerializer, FutureCourseSerializer
from rest_framework import status

routes = [
    '/api/v1/fcourses/'
    '/api/v1/courses/',
    '/api/v1/courses/create',

    '/api/v1/courses/upload/',

    '/api/v1/courses/top/',
    '/api/v1/courses/<id>/',

    '/api/v1/courses/delete/<id>/',
    '/api/v1/courses/<update>/<id>/',
]


@api_view(http_method_names=['GET'])
def getRoutes(request):
    return Response(routes)


@api_view(http_method_names=['GET'])
def getCourses(request):
    courses = Course.objects.all()
    serializer = CourseSerializer(courses, many=True)
    return Response(serializer.data)


@api_view(http_method_names=['GET'])
def getCourse(request, sl):
    course = Course.objects.get(_id=sl)
    serializer = CourseSerializer(course, many=False)
    return Response(serializer.data)


@api_view(http_method_names=['POST'])
def postCourses(request):
    serializer = FutureCourseSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    # courses = Course.objects.all()
    # serializer = CourseSerializer(courses, many=True)
    # return Response(serializer.data)
