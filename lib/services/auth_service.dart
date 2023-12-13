import 'package:compasia/helpers/utils.dart';
import 'package:flutter/material.dart';

import '../helpers/logger.dart';
import '../main.dart';
import '../models/auth_credential.dart';
import '../models/user.dart';
import '../repositories/auth_repository.dart';
import 'share_preferences_service.dart';

class AuthService extends ChangeNotifier {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearUser() {
    _currentUser = null;
  }

  void logout() {
    SharedPreferencesService sharedPreferencesService =
        SharedPreferencesService();
    sharedPreferencesService.removeAuthCredential();
    _currentUser = null;
    notifyListeners();
    navigatorKey.currentState!.popUntil((route) => route.isFirst);

  }

  Future<void> init() async {
    await initialLogin();
    _isInitialized = true;
    notifyListeners();

  }

  Future<void> initialLogin() async {
    SharedPreferencesService sharedPreferencesService =
        SharedPreferencesService();

    AuthCredential? cachedAuthCredential =
        sharedPreferencesService.getAuthCredential();
    if (cachedAuthCredential == null) return;
    User? cachedUser = await AuthRepository.cachedLogin();
    if (cachedUser != null) {
      _currentUser = cachedUser;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await AuthRepository.loginWithEmail(
        email: email,
        password: password,
        onError: (error) {
          Utils.toast(error);
        },
      );
      if (user != null) {
        debugPrint('user ==> ${user.toJson()}');
        setUser(user);
      }
    } catch (e) {
      logError(e);
    }
  }
}
