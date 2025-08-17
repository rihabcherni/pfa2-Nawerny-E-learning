import 'package:flutter/material.dart';
import 'package:pfa_frontend/screens/admin/pages/admin_dashboard_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/admin_profile_screen.dart';
import 'package:pfa_frontend/screens/student/pages/home_screen.dart';
import 'package:pfa_frontend/screens/student/pages/quiz_screen.dart';
import 'package:pfa_frontend/screens/student/pages/score_screen.dart';
import 'package:pfa_frontend/screens/student/pages/settings_screen.dart';
import 'package:pfa_frontend/screens/student/pages/student_dashboard_screen.dart';
import 'package:pfa_frontend/screens/student/pages/student_profile_screen.dart';
import 'package:pfa_frontend/screens/teacher/pages/HomeScreen.dart';
import 'package:pfa_frontend/screens/teacher/pages/ProfileScreen.dart';
import 'package:pfa_frontend/screens/teacher/pages/etudiantsScreen.dart';
import 'package:pfa_frontend/screens/visitor/pages/all_course.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/forgot_password.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/login_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/register_teacher_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/register_student_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/update_password_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/auth/verify_email_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/course_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/loading_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/role_screen.dart';
import 'package:pfa_frontend/screens/visitor/pages/settings.dart';
import 'package:pfa_frontend/screens/visitor/pages/welcome_screen.dart';
import 'package:pfa_frontend/screens/visitor/widgets/category.dart';
import 'package:pfa_frontend/screens/visitor/widgets/new_courses.dart';
import 'package:pfa_frontend/screens/visitor/widgets/top_course.dart';
import 'package:pfa_frontend/screens/visitor/widgets/your_course.dart';

class ListeRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      case '/settings-size':
        return MaterialPageRoute(builder: (_) => SettingsScreen());

      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/all-courses':
        return MaterialPageRoute(builder: (_) => AllCourseScreen());
      case '/course/category':
        return MaterialPageRoute(builder: (_) => CategoryCourseScreen());
      case '/course/top_courses':
        return MaterialPageRoute(builder: (_) => TopCourseScreen());
      case '/course/new_courses':
        return MaterialPageRoute(builder: (_) => NewCourseScreen());
      case '/course/your_course':
        return MaterialPageRoute(builder: (_) => YourCourseScreen());
      case '/role-selection':
        return MaterialPageRoute(builder: (_) => const RoleSelectionScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsPage());

      // auth
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register-student':
        return MaterialPageRoute(builder: (_) => const RegisterStudentScreen());
      case '/register-teacher':
        return MaterialPageRoute(builder: (_) => const RegisterTeacherScreen());
      case '/update-password':
        return MaterialPageRoute(builder: (_) => const UpdatePasswordScreen());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/verify-email':
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());

      // student
      case '/student':
        return MaterialPageRoute(
            builder: (_) => const StudentDashboardScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/student/profile':
        return MaterialPageRoute(builder: (_) => const StudentProfileScreen());
      case '/courses':
        final args = settings.arguments;
        if (args != null && args is int) {
          return MaterialPageRoute(builder: (_) => CourseScreen(args));
        } else {
          return _errorRoute(settings);
        }
      case '/quiz':
        return MaterialPageRoute(builder: (_) => QuizScreen());
      case '/quiz/score':
        return MaterialPageRoute(builder: (_) => ScoreScreen());

      case '/teacher':
        return MaterialPageRoute(builder: (_) => HomeScreenTeacher());
      case '/Etudiant':
        return MaterialPageRoute(builder: (_) => EtudiantScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      // admin
      case '/admin':
        return MaterialPageRoute(builder: (_) => AdminDashboardScreen());
      case '/admin/profile':
        return MaterialPageRoute(builder: (_) => AdminProfileScreen());

      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ERROR: Route ${settings.name} not found.'),
              if (settings.arguments != null)
                Text('Arguments: ${settings.arguments.toString()}'),
            ],
          ),
        ),
      );
    });
  }
}
