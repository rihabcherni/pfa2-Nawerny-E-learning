from rest_framework import serializers
from .models import  Category, ContenuAudio, ContenuImage, ContenuTexte, ContenuVideo, Cours, Lecon, Inscription, Commentaire, Review
from django.db.models import Sum
from django.conf import settings

class CategorySerializer(serializers.ModelSerializer):
    course_number = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = '__all__'

    def get_course_number(self, category):
        return category.courseNumber()

class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = "__all__"

class CoursOnlySerializer(serializers.ModelSerializer):
    category = serializers.SerializerMethodField()
    auteur = serializers.SerializerMethodField()
    auteur_photo = serializers.SerializerMethodField()
    lecon_number = serializers.SerializerMethodField()
    total_ratings = serializers.SerializerMethodField()
    total_reviews = serializers.SerializerMethodField()
    class Meta:
        model = Cours
        fields = '__all__'
    def get_lecon_number(self, cours):
        return cours.leconNumber()
    
    def get_category(self, cours):
        return cours.category.name
    
    def get_auteur(self, cours):
        return cours.auteur.first_name+ " "+cours.auteur.last_name
    
    def get_auteur_photo(self, cours):
        if cours.auteur.photo:
            api_url = settings.API_BASE_URL
            return api_url+'/'+cours.auteur.photo.url
        else:
            return None
        
    def get_total_reviews(self, obj):
        total_reviews = obj.reviews.count()
        return total_reviews or 0

    def get_total_ratings(self, obj):
        total_ratings = Review.objects.filter(cours=obj).aggregate(Sum('rating'))['rating__sum'] 
        return total_ratings or 0
    
class CoursSerializer(serializers.ModelSerializer):
    lecon_number = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField(method_name='get_reviews',read_only=True)
    lecons = serializers.SerializerMethodField(method_name='get_lecons', read_only=True)
    total_ratings = serializers.SerializerMethodField()
    total_reviews = serializers.SerializerMethodField()

    class Meta:
        model = Cours
        fields = '__all__'
    def validate_auteur(self, value):
        if value.type_user != 'auteur':
            raise serializers.ValidationError("Only teachers can be assigned as the auteurs for a course.")
        return value
    
    def get_lecon_number(self, cours):
        return cours.leconNumber()
  
    def get_lecons(self, obj):
        lecons = Lecon.objects.filter(cours=obj)
        serializer = LeconSerializer(lecons, many=True)
        return serializer.data

    def get_total_reviews(self, obj):
        total_reviews = obj.reviews.count()
        return total_reviews or 0

    def get_total_ratings(self, obj):
        total_ratings = Review.objects.filter(cours=obj).aggregate(Sum('rating'))['rating__sum'] 
        return total_ratings or 0

    def get_reviews(self,obj):
        reviews = obj.reviews.all()
        serializer = ReviewSerializer(reviews,many=True)
        return serializer.data

class LeconOnlySerializer(serializers.ModelSerializer):
    class Meta:
        model = Lecon
        fields = '__all__'

class LeconSerializer(serializers.ModelSerializer):
    image_number = serializers.SerializerMethodField()
    audio_number = serializers.SerializerMethodField()
    video_number = serializers.SerializerMethodField()
    texte_number = serializers.SerializerMethodField()
    contenu_texts = serializers.SerializerMethodField(method_name='get_text', read_only=True)
    contenu_images = serializers.SerializerMethodField(method_name='get_image', read_only=True)
    contenu_videos = serializers.SerializerMethodField(method_name='get_video', read_only=True)
    contenu_audio = serializers.SerializerMethodField(method_name='get_audio', read_only=True)

    class Meta:
        model = Lecon
        fields = '__all__'

    def get_text(self, obj):
        contenuText = ContenuTexte.objects.filter(lecon=obj)
        serializer = ContenuTexteSerializer(contenuText, many=True)
        return serializer.data

    def get_image(self, obj):
        contenuImage = ContenuImage.objects.filter(lecon=obj)
        serializer = ContenuImageSerializer(contenuImage, many=True)
        return serializer.data

    def get_audio(self, obj):
        contenuAudio = ContenuAudio.objects.filter(lecon=obj)
        serializer = ContenuAudioSerializer(contenuAudio, many=True)
        return serializer.data

    def get_video(self, obj):
        contenuVideo = ContenuVideo.objects.filter(lecon=obj)
        serializer = ContenuVideoSerializer(contenuVideo, many=True)
        return serializer.data

    def get_image_number(self, lecon):
        return lecon.imageNumber()
    
    def get_texte_number(self, lecon):
        return lecon.texteNumber()
        
    def get_audio_number(self, lecon):
        return lecon.audioNumber()

    def get_video_number(self, lecon):
        return lecon.videoNumber()

class ContenuTexteSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContenuTexte
        fields = '__all__'

class ContenuImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContenuImage
        fields = '__all__'

class ContenuVideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContenuVideo
        fields = '__all__'

class ContenuAudioSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContenuAudio
        fields = '__all__'

class InscriptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Inscription
        fields = '__all__'
    def validate_user(self, value):
        if value.type_user != 'apprenant':
            raise serializers.ValidationError("Only Etudiants can create an inscription.")
        return value
    
class CommentaireSerializer(serializers.ModelSerializer):
    class Meta:
        model = Commentaire
        fields = '__all__'

    def validate_user(self, value):
        if value.type_user != 'apprenant':
            raise serializers.ValidationError("Only Etudiants can create a comment.")
        return value
    