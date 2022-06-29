from django.db import models

class Course(models.Model):
    _id = models.AutoField(primary_key=True, editable=False)
    name = models.CharField(max_length=200)
    image = models.ImageField()
    video = models.CharField(max_length=50)
    category = models.CharField(max_length=200)
    description = models.TextField()
    createdAt = models.DateTimeField(auto_now_add=True)
    deadline = models.IntegerField()
    languageFrom = models.CharField(max_length=20)
    languageTo = models.CharField(max_length=20)

    def __str__(self):
         return self.name

class FutureCourse(models.Model):
    _id = models.AutoField(primary_key=True, editable=False)
    link = models.TextField()
    category = models.CharField(max_length=200)
    createdAt = models.DateTimeField(auto_now_add=True)
    languageFrom = models.CharField(max_length=20)
    languageTo = models.CharField(max_length=20)
    
    def __str__(self):
         return str(self.createdAt)