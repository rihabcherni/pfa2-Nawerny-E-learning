from django.db import models
from accounts.models import User
from course.models import Cours

class Discussion(models.Model):
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    titre = models.CharField(max_length=255)
    description= models.CharField(max_length=255)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.titre}"
    
class QuestionPoser(models.Model):
    discussion = models.ForeignKey(Discussion, on_delete=models.CASCADE)
    apprenant = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
    question= models.CharField(max_length=255)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.question}"
    
class Reponse(models.Model):
    question_poser = models.ForeignKey(QuestionPoser, on_delete=models.CASCADE)
    auteur = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
    contenu= models.CharField(max_length=255)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.contenu}"