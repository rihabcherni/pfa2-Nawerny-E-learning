from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Lecon, contenuTexte, contenuImage, contenuVideo, contenuAudio

@receiver(post_save, sender=contenuTexte)
@receiver(post_save, sender=contenuImage)
@receiver(post_save, sender=contenuVideo)
@receiver(post_save, sender=contenuAudio)
def incrementer_ordre(sender, instance, created, **kwargs):
    if created:  
        lecon = instance.lecon
        lecon.incrementer_ordre()
