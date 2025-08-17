from unicodedata import name
from django.urls import path
from django.conf.urls.static import static

from project import settings

from .views import (
        ApprenantListView,
        AuteurListView,
        RegisterView,
        UpdateUserProfileView,
        UserDetailView,
        UserProfileView, 
        VerifyUserEmail,
        LoginUserView, 
        TestingAuthenticatedReq, 
        PasswordResetConfirm, 
        PasswordResetRequestView,SetNewPasswordView, LogoutApiView)
from rest_framework_simplejwt.views import (TokenRefreshView,)
from .views import GoogleOauthSignInview

urlpatterns = [
    
    path('auteur-list/', AuteurListView.as_view(), name='liste-auteur'),
    path('apprenant-list/', ApprenantListView.as_view(), name='liste-apprenant'),
    path('user/<int:pk>/', UserDetailView.as_view(), name='user-detail'),
    path('google/', GoogleOauthSignInview.as_view(), name='google'),
    path('register/', RegisterView.as_view(), name='register'),
    path('verify-email/', VerifyUserEmail.as_view(), name='verify'),
    path('login/', LoginUserView.as_view(), name='login-user'),
  
    path('profile/', UserProfileView.as_view(), name='profile'),
    path('profile/update/', UpdateUserProfileView.as_view(), name='update-user-profile'),
  
    path('password-reset/', PasswordResetRequestView.as_view(), name='password-reset'),
    path('password-reset-confirm/<uidb64>/<token>/', PasswordResetConfirm.as_view(), name='reset-password-confirm'),
    path('set-new-password/', SetNewPasswordView.as_view(), name='set-new-password'),
  
    path('logout/', LogoutApiView.as_view(), name='logout'),

    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('get-something/', TestingAuthenticatedReq.as_view(), name='just-for-testing')
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
    document_root=settings.MEDIA_ROOT)
