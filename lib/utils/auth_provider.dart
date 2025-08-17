import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _authToken;
  String? _refreshAuthToken;
  bool _isLoggedIn = false;
  String? _userType;
  String? _email;
  String? _fullName;

  AuthProvider() {
    _loadAuthToken();
  }

  String? get authToken => _authToken;
  String? get refreshAuthToken => _refreshAuthToken;
  bool get isLoggedIn => _isLoggedIn;
  String? get userType => _userType;
  String? get email => _email;
  String? get fullName => _fullName;

  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString('authToken');
    _refreshAuthToken = prefs.getString('refreshAuthToken');
    _isLoggedIn = _authToken != null;
    _userType = prefs.getString('userType');
    _email = prefs.getString('email');
    _fullName = prefs.getString('full_name');
    notifyListeners();
  }

  Future<void> setAuthToken(
      String? token, String? refreshAuthToken, String? userType) async {
    _authToken = token;
    _refreshAuthToken = refreshAuthToken;
    _isLoggedIn = token != null;
    _userType = userType;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token ?? '');
    await prefs.setString('refreshAuthToken', refreshAuthToken ?? '');
    notifyListeners();
  }
}
