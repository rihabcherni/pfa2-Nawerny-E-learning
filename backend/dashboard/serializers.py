from rest_framework import serializers

class DashAdminCountSerializer(serializers.Serializer):
    admin_count = serializers.IntegerField()
    student_count = serializers.IntegerField()
    teacher_count = serializers.IntegerField()
    course_count = serializers.IntegerField()
    category_count = serializers.IntegerField()
