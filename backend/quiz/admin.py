from django.contrib import admin

from quiz.models import ApprenantQuizReponse, QuestionQuiz, Quiz, ReponseQuestionQuiz


admin.site.register(Quiz)
admin.site.register(QuestionQuiz)
admin.site.register(ReponseQuestionQuiz)
admin.site.register(ApprenantQuizReponse)
