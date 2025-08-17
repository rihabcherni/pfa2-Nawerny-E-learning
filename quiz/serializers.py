from rest_framework import serializers
from .models import Quiz, QuestionQuiz, ReponseQuestionQuiz, ApprenantQuizReponse

class ReponseQuestionQuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReponseQuestionQuiz
        fields = '__all__'

class QuestionQuizSerializer(serializers.ModelSerializer):
    reponses = serializers.SerializerMethodField(method_name='get_reponses', read_only=True)
    class Meta:
        model = QuestionQuiz
        fields = '__all__'

    def get_reponses(self, obj):
        reponses = ReponseQuestionQuiz.objects.filter(question=obj)
        serializer = ReponseQuestionQuizSerializer(reponses, many=True)
        return serializer.data
    
class ApprenantQuizReponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprenantQuizReponse
        fields = '__all__'

class QuizSerializer(serializers.ModelSerializer):
    questions = serializers.SerializerMethodField(method_name='get_questions', read_only=True)
    
    class Meta:
        model = Quiz
        fields = '__all__'

    def get_questions(self, obj):
        questions = QuestionQuiz.objects.filter(quiz=obj)
        serializer = QuestionQuizSerializer(questions, many=True)
        return serializer.data