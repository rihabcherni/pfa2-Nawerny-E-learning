from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils.translation import gettext_lazy as _
from rest_framework_simplejwt.tokens import RefreshToken

from .managers import UserManager
AUTH_PROVIDERS = {'email': 'email', 'google': 'google', 'github': 'github', 'linkedin': 'linkedin'}

class User(AbstractBaseUser, PermissionsMixin):
    TYPE_CHOICES = (
        ('admin', 'Admin'),
        ('apprenant', 'Apprenant'),
        ('auteur', 'Auteur'),
    )    
    email = models.EmailField(max_length=255, verbose_name=_("Email Address"), unique=True)
    first_name = models.CharField(max_length=100, verbose_name=_("First Name"), default='')
    last_name = models.CharField(max_length=100, verbose_name=_("Last Name"), default='')
    phone_number = models.CharField(max_length=15, verbose_name=_("Phone Number"), blank=True, null=True)
    address = models.CharField(max_length=255, verbose_name=_("Address"), blank=True, null=True)
    ville = models.CharField(max_length=255, verbose_name=_("Ville"), blank=True, null=True)
    date_of_birth = models.DateField(verbose_name=_("Date of Birth"), blank=True, null=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now=True)
    auth_provider = models.CharField(max_length=50, blank=False, null=False, default=AUTH_PROVIDERS.get('email'))
    type_user = models.CharField(max_length=20, choices=TYPE_CHOICES)
    photo = models.ImageField(upload_to='assets/user_photos/', blank=True, null=True)  

    USERNAME_FIELD = "email"

    REQUIRED_FIELDS = ["first_name", "last_name","type_user"]

    objects = UserManager()

    def tokens(self):    
        refresh = RefreshToken.for_user(self)
        return {
            "refresh": str(refresh),
            "access": str(refresh.access_token)
        }
    
    @property
    def get_full_name(self):
        return f"{self.first_name.title()} {self.last_name.title()}"

    def __str__(self):
        return f"{self.email} - {self.get_full_name} - {self.type_user}"

class OneTimePassword(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    otp = models.CharField(max_length=4, default='1234')

    def __str__(self):
        return f"{self.user.first_name} - otp code"
