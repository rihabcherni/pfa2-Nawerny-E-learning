from django.urls import path
from quiz.views import *

urlpatterns = [
    path('quizzes/', QuizListCreateView.as_view(), name='quiz-list-create'),
    path('quizzes/<int:pk>/', QuizRetrieveUpdateDestroyView.as_view(), name='quiz-retrieve-update-destroy'),
    path('questions/', QuestionQuizListCreateView.as_view(), name='question-list-create'),
    path('questions/<int:pk>/', QuestionQuizRetrieveUpdateDestroyView.as_view(), name='question-retrieve-update-destroy'),
    path('answers/', ReponseQuestionQuizListCreateView.as_view(), name='answer-list-create'),
    path('answers/<int:pk>/', ReponseQuestionQuizRetrieveUpdateDestroyView.as_view(), name='answer-retrieve-update-destroy'),
    path('responses/', ApprenantQuizReponseListCreateView.as_view(), name='response-list-create'),
    path('responses/<int:pk>/', ApprenantQuizReponseRetrieveUpdateDestroyView.as_view(), name='response-retrieve-update-destroy'),
]