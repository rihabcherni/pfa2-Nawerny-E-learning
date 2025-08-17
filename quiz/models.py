from django.db import models

from accounts.models import User
from course.models import Lecon

class Quiz(models.Model):
    lecon = models.ForeignKey(Lecon, on_delete=models.CASCADE)
    titre = models.CharField(max_length=255)
    quiz_image = models.ImageField(upload_to='assets/quiz', null=True, blank=True)
    description_image = models.CharField(max_length=255)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.titre}"
    
class QuestionQuiz(models.Model):
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE)
    question = models.CharField(max_length=255)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.question
    
class ReponseQuestionQuiz(models.Model):
    question = models.ForeignKey(QuestionQuiz, on_delete=models.CASCADE)
    option = models.CharField(max_length=255)
    est_correcte = models.BooleanField(default=False)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
        
    def __str__(self):
        return self.option    

class ApprenantQuizReponse(models.Model):
    apprenant = models.ForeignKey(User, on_delete=models.CASCADE)
    question = models.ForeignKey(QuestionQuiz, on_delete=models.CASCADE)
    numero_reponse = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.apprenant} - Question:{self.question} - Response: {self.numero_reponse}"

