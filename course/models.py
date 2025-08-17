from django.utils import timezone
from djongo import models
from accounts.models import User

class Category(models.Model):
    name = models.CharField(max_length=100)
    icon = models.CharField(max_length=100, default='0xe148')
    image = models.ImageField(upload_to='assets/category', default='assets/category/autre.PNG', blank=True)
    desciption_image = models.CharField(max_length=255, default="")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    
    def courseNumber(self):
        return Cours.objects.filter(category=self).count()

class Cours(models.Model):
    NIVEAU_CHOICES = (
        ('beginner', 'Beginner'),
        ('intermediate', 'Intermediate'),
        ('advanced', 'Advanced'),
    )
    
    LANGUE_CHOICES = (
        ('francais', 'Francais'),
        ('anglais', 'Anglais'),
        ('espagnol', 'Espagnol'),
        ('allemand', 'Allemand'),
        ('italien', 'Italien'),
        ('portugais', 'Portugais'),
        ('chinois', 'Chinois'),
        ('arabe', 'Arabe'),
    )

    titre = models.CharField(max_length=255)
    cours_photo = models.ImageField(upload_to='assets/cours', null=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, default=None)
    description = models.TextField()
    langue = models.CharField(max_length=20, choices=LANGUE_CHOICES, default="")  
    auteur = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
    niveau = models.CharField(max_length=20, choices=NIVEAU_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.titre
    
    def leconNumber(self):
        return Lecon.objects.filter(cours=self).count()
        
    def last_5_courses():
        return Cours.objects.order_by('-created_at')[:5]
    
class Review(models.Model):
    cours = models.ForeignKey(Cours, null=True, on_delete=models.CASCADE,related_name='reviews')
    apprenant = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    rating = models.IntegerField(default=0)
    comment = models.TextField(max_length=1000,default="",blank=False) 
    createAt = models.DateTimeField(auto_now_add=True) 

    def __str__(self):
        return self.comment

class Inscription(models.Model):
    apprenant = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    progression = models.IntegerField(default=0)
    date_inscription = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.apprenant} - {self.course} - Score: {self.score}"
    
class Lecon(models.Model):
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE, null=True)
    titre = models.CharField(max_length=255)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.titre
    def imageNumber(self):
        return ContenuImage.objects.filter(lecon=self).count()    
    def audioNumber(self):
        return ContenuAudio.objects.filter(lecon=self).count()    
    def videoNumber(self):
        return ContenuVideo.objects.filter(lecon=self).count()    
    def texteNumber(self):
        return ContenuTexte.objects.filter(lecon=self).count()

class ContenuTexte(models.Model):
    lecon = models.ForeignKey(Lecon, on_delete=models.CASCADE)
    titre = models.CharField(max_length=255)
    texte = models.TextField()
    ordre = models.IntegerField(default=0)
    
    def __str__(self):
        return self.titre

class ContenuImage(models.Model):
    lecon = models.ForeignKey(Lecon, on_delete=models.CASCADE)
    titre = models.CharField(max_length=255)
    lien_image = models.ImageField(upload_to='assets/lecons/images', null=True, blank=True)
    desciption_image = models.CharField(max_length=255, default="")
    ordre = models.IntegerField(default=0)

    def __str__(self):
        return self.titre

class ContenuVideo(models.Model):
    lecon = models.ForeignKey(Lecon, on_delete=models.CASCADE)
    titre = models.CharField(max_length=255)
    lien_video = models.URLField(null=True, blank=True)
    desciption_video = models.CharField(max_length=255, default="")
    ordre = models.IntegerField(default=0)

    def __str__(self):
        return self.titre

class ContenuAudio(models.Model):
    lecon = models.ForeignKey(Lecon, on_delete=models.CASCADE)
    titre = models.CharField(max_length=255)
    lien_audio = models.FileField(upload_to='assets/lecons/audio', null=True, blank=True)
    desciption_audio = models.CharField(max_length=255, default="")
    ordre = models.IntegerField(default=0)

    def __str__(self):
        return self.titre
    
class Commentaire(models.Model):
    apprenant =  models.ForeignKey(User, on_delete=models.CASCADE, default=None)
    lecon = models.ForeignKey(Lecon, on_delete=models.CASCADE)
    message = models.TextField()
    date_commentaire = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.apprenant} - {self.lecon}"
