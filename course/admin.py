from django.contrib import admin
from .models import  Category, ContenuAudio, ContenuImage, ContenuTexte, ContenuVideo, Cours, Lecon, Inscription, Commentaire, Review

admin.site.register(Category)
admin.site.register(Cours)
admin.site.register(Inscription)
admin.site.register(Review)

admin.site.register(Lecon)
admin.site.register(ContenuTexte)
admin.site.register(ContenuImage)
admin.site.register(ContenuVideo)
admin.site.register(ContenuAudio)
admin.site.register(Commentaire)
