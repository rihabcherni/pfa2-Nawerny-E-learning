from django.http import JsonResponse
from rest_framework import generics
from .models import Category, ContenuAudio, ContenuImage, ContenuTexte, ContenuVideo, Cours, Lecon, Inscription, Commentaire, Review
from .serializers import CategorySerializer, ContenuAudioSerializer, ContenuImageSerializer, ContenuTexteSerializer, ContenuVideoSerializer, CoursOnlySerializer, CoursSerializer, LeconOnlySerializer, LeconSerializer, InscriptionSerializer, CommentaireSerializer, ReviewSerializer
from django.http import JsonResponse
from rest_framework.decorators import api_view
from django.conf import settings


class CategoryListCreate(generics.ListCreateAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class CategoryRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class CoursListCreate(generics.ListCreateAPIView):
    queryset = Cours.objects.all()
    serializer_class = CoursSerializer

class CoursRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Cours.objects.all()
    serializer_class = CoursSerializer

class CoursOnlyListCreate(generics.ListCreateAPIView):
    queryset = Cours.objects.all()
    serializer_class = CoursOnlySerializer

class CoursOnlyRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Cours.objects.all()
    serializer_class = CoursOnlySerializer

class LeconListCreate(generics.ListCreateAPIView):
    queryset = Lecon.objects.all()
    serializer_class = LeconSerializer

class LeconRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Lecon.objects.all()
    serializer_class = LeconSerializer

class LeconListByCourse(generics.ListAPIView):
    serializer_class = LeconOnlySerializer

    def get_queryset(self):
        course_id = self.kwargs['course_id']
        return Lecon.objects.filter(cours_id=course_id)
    
class ContenuTexteListCreate(generics.ListCreateAPIView):
    queryset = ContenuTexte.objects.all()
    serializer_class = ContenuTexteSerializer

class ContenuTexteRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = ContenuTexte.objects.all()
    serializer_class = ContenuTexteSerializer

class ContenuImageListCreate(generics.ListCreateAPIView):
    queryset = ContenuImage.objects.all()
    serializer_class = ContenuImageSerializer

class ContenuImageRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = ContenuImage.objects.all()
    serializer_class = ContenuImageSerializer

class ContenuAudioListCreate(generics.ListCreateAPIView):
    queryset = ContenuAudio.objects.all()
    serializer_class = ContenuAudioSerializer

class ContenuAudioRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = ContenuAudio.objects.all()
    serializer_class = ContenuAudioSerializer

class ContenuVideoListCreate(generics.ListCreateAPIView):
    queryset = ContenuVideo.objects.all()
    serializer_class = ContenuVideoSerializer

class ContenuVideoRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = ContenuVideo.objects.all()
    serializer_class = ContenuVideoSerializer

class InscriptionListCreate(generics.ListCreateAPIView):
    queryset = Inscription.objects.all()
    serializer_class = InscriptionSerializer

class InscriptionRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Inscription.objects.all()
    serializer_class = InscriptionSerializer

class CommentaireListCreate(generics.ListCreateAPIView):
    queryset = Commentaire.objects.all()
    serializer_class = CommentaireSerializer

class CommentaireRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Commentaire.objects.all()
    serializer_class = CommentaireSerializer


class ReviewListCreate(generics.ListCreateAPIView):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

class ReviewRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

@api_view(['GET'])
def courses_by_category(request, category_id):
    courses = Cours.objects.filter(category_id=category_id)
    serializer = CoursOnlySerializer(courses, many=True)
    return JsonResponse(serializer.data, safe=False)

def last_5_courses_api(request):
    courses = Cours.last_5_courses()
    data = []
    api_url = settings.API_BASE_URL
    for course in courses:
        author = course.auteur
        author_name = f"{author.first_name} {author.last_name}"
        
        cours_photo_url = course.cours_photo.url if course.cours_photo else None
        if cours_photo_url:
            cours_photo_url = api_url+cours_photo_url

        author_photo_url = author.photo.url if author.photo else None
        if author_photo_url:
            author_photo_url =api_url+author_photo_url
        course_data = {
            'id': course.id,
            'title': course.titre,
            'cours_photo': cours_photo_url,
            'category': course.category.name,
            'description': course.description,
            'langue': course.langue,
            'niveau': course.niveau,
            'auteur': author_name,
            'author_photo':author_photo_url,
            'created_at': course.created_at
        }
        data.append(course_data)
    return JsonResponse(data, safe=False)
