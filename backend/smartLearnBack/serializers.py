from rest_framework import serializers
from .models import Course
from .models import FutureCourse


class CourseSerializer (serializers.ModelSerializer) :
    class Meta :
        model = Course
        fields = '__all__'
        
class FutureCourseSerializer (serializers.ModelSerializer) :
    class Meta :
        model = FutureCourse
        fields = '__all__'