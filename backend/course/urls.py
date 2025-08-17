from django.urls import path
from course.views import *
from project import settings
from django.conf.urls.static import static

urlpatterns = [
    path('category/', CategoryListCreate.as_view(), name='category-list-create'),
    path('category/<int:pk>/', CategoryRetrieveUpdateDestroy.as_view(), name='category-retrieve-update-destroy'),   
    
    path('cours/', CoursListCreate.as_view(), name='cours-list-create'),
    path('cours/<int:pk>/', CoursRetrieveUpdateDestroy.as_view(), name='cours-retrieve-update-destroy'),
    path('cours-only/<int:pk>/', CoursOnlyRetrieveUpdateDestroy.as_view(), name='cours-only-retrieve-update-destroy'),
    path('cours-only/', CoursOnlyListCreate.as_view(), name='cours-only'),
    path('last-5-courses/', last_5_courses_api, name='last_5_courses_api'),
    path('courses/category/<int:category_id>/', courses_by_category, name='courses_by_category'),
    path('courses/<int:course_id>/lessons/', LeconListByCourse.as_view(), name='course-lessons'),

    path('lecons/', LeconListCreate.as_view(), name='lecon-list-create'),
    path('lecons/<int:pk>/', LeconRetrieveUpdateDestroy.as_view(), name='lecon-retrieve-update-destroy'),

    path('contenu-image/', ContenuImageListCreate.as_view(), name='contenu-image-list-create'),
    path('contenu-image/<int:pk>/', ContenuImageRetrieveUpdateDestroy.as_view(), name='contenu-image-retrieve-update-destroy'),

    path('contenu-texte/', ContenuTexteListCreate.as_view(), name='contenu-texte-list-create'),
    path('contenu-texte/<int:pk>/', ContenuTexteRetrieveUpdateDestroy.as_view(), name='contenu-texte-retrieve-update-destroy'),

    path('contenu-audio/', ContenuAudioListCreate.as_view(), name='contenu-audio-list-create'),
    path('contenu-audio/<int:pk>/', ContenuAudioRetrieveUpdateDestroy.as_view(), name='contenu-audio-retrieve-update-destroy'),

    path('contenu-video/', ContenuVideoListCreate.as_view(), name='contenu-video-list-create'),
    path('contenu-video/<int:pk>/', ContenuVideoRetrieveUpdateDestroy.as_view(), name='contenu-video-retrieve-update-destroy'),
    
    path('inscriptions/', InscriptionListCreate.as_view(), name='inscription-list-create'),
    path('inscriptions/<int:pk>/', InscriptionRetrieveUpdateDestroy.as_view(), name='inscription-retrieve-update-destroy'),
       
    path('reviews/', ReviewListCreate.as_view(), name='Review-list-create'),
    path('reviews/<int:pk>/', ReviewRetrieveUpdateDestroy.as_view(), name='Review-retrieve-update-destroy'),
   
    path('commentaires/', CommentaireListCreate.as_view(), name='commentaire-list-create'),
    path('commentaires/<int:pk>/', CommentaireRetrieveUpdateDestroy.as_view(), name='commentaire-retrieve-update-destroy'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


