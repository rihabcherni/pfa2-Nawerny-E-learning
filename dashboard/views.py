from accounts.models import User
from course.models import Category, Cours
from dashboard.serializers import DashAdminCountSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from django.http import JsonResponse
from datetime import datetime

class AdminDashCountAPIView(APIView):
    def get(self, request, format=None):
        admin_count = User.objects.get_count_by_type('admin')
        student_count = User.objects.get_count_by_type('apprenant')
        teacher_count = User.objects.get_count_by_type('auteur')
        course_count = Cours.objects.count()
        category_count= Category.objects.count()
        data = {
            'admin_count': admin_count,
            'student_count': student_count,
            'teacher_count': teacher_count,
            'course_count': course_count,
            'category_count': category_count,
        }
        serializer = DashAdminCountSerializer(data)
        return Response(serializer.data, status=status.HTTP_200_OK)

def get_course_counts_by_month(request):
    year = int(request.GET.get('year', datetime.now().year))

    course_counts = Cours.objects.filter(created_at__year=year)
    course_counts_last = Cours.objects.filter(created_at__year=year-1)
    
    counts_by_month = [0] * 12
    counts_by_month_last = [0] * 12
    for course in course_counts:
        month = course.created_at.month
        counts_by_month[month - 1] += 1

    for course in course_counts_last:
        month = course.created_at.month
        counts_by_month_last[month - 1] += 1

    response_data = {
        'last_year': year-1,
        'counts_by_month_last_year': counts_by_month_last,
        'year': year,
        'counts_by_month': counts_by_month
    }
    return JsonResponse(response_data)