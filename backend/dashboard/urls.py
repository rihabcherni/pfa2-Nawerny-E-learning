from unicodedata import name
from django.urls import path
from .views import AdminDashCountAPIView
from dashboard import views

urlpatterns = [
      path('dash-count/', AdminDashCountAPIView.as_view(), name='admin-dash-count'),
      path('course-barchart/', views.get_course_counts_by_month, name='course_barchart'),

]