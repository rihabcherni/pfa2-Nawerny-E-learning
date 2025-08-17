from rest_framework import generics
from .models import Discussion, QuestionPoser, Reponse
from .serializers import DiscussionSerializer, QuestionPoserSerializer, ReponseSerializer

class DiscussionListCreateView(generics.ListCreateAPIView):
    queryset = Discussion.objects.all()
    serializer_class = DiscussionSerializer

class DiscussionRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Discussion.objects.all()
    serializer_class = DiscussionSerializer

class QuestionPoserListCreateView(generics.ListCreateAPIView):
    queryset = QuestionPoser.objects.all()
    serializer_class = QuestionPoserSerializer

class QuestionPoserRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = QuestionPoser.objects.all()
    serializer_class = QuestionPoserSerializer

class ReponseListCreateView(generics.ListCreateAPIView):
    queryset = Reponse.objects.all()
    serializer_class = ReponseSerializer

class ReponseRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Reponse.objects.all()
    serializer_class = ReponseSerializer
