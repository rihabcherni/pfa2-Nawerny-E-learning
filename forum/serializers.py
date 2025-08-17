from rest_framework import serializers
from .models import Discussion, QuestionPoser, Reponse

class DiscussionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discussion
        fields = '__all__'

class QuestionPoserSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionPoser
        fields = '__all__'

class ReponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reponse
        fields = '__all__'
