from rest_framework import generics
from .models import Quiz, QuestionQuiz, ReponseQuestionQuiz, ApprenantQuizReponse
from .serializers import QuizSerializer, QuestionQuizSerializer, ReponseQuestionQuizSerializer, ApprenantQuizReponseSerializer

class QuizListCreateView(generics.ListCreateAPIView):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer

class QuizRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer

class QuestionQuizListCreateView(generics.ListCreateAPIView):
    queryset = QuestionQuiz.objects.all()
    serializer_class = QuestionQuizSerializer

class QuestionQuizRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = QuestionQuiz.objects.all()
    serializer_class = QuestionQuizSerializer

class ReponseQuestionQuizListCreateView(generics.ListCreateAPIView):
    queryset = ReponseQuestionQuiz.objects.all()
    serializer_class = ReponseQuestionQuizSerializer

class ReponseQuestionQuizRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = ReponseQuestionQuiz.objects.all()
    serializer_class = ReponseQuestionQuizSerializer

class ApprenantQuizReponseListCreateView(generics.ListCreateAPIView):
    queryset = ApprenantQuizReponse.objects.all()
    serializer_class = ApprenantQuizReponseSerializer

class ApprenantQuizReponseRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = ApprenantQuizReponse.objects.all()
    serializer_class = ApprenantQuizReponseSerializer
