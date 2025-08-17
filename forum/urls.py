from django.urls import path
from .views import *

urlpatterns = [
    path('discussions/', DiscussionListCreateView.as_view(), name='discussion-list-create'),
    path('discussions/<int:pk>/', DiscussionRetrieveUpdateDestroyView.as_view(), name='discussion-retrieve-update-destroy'),
    path('questions/', QuestionPoserListCreateView.as_view(), name='questionposer-list-create'),
    path('questions/<int:pk>/', QuestionPoserRetrieveUpdateDestroyView.as_view(), name='questionposer-retrieve-update-destroy'),
    path('responses/', ReponseListCreateView.as_view(), name='reponse-list-create'),
    path('responses/<int:pk>/', ReponseRetrieveUpdateDestroyView.as_view(), name='reponse-retrieve-update-destroy'),
]
