import '../models/user.dart';

class UserService {
  static final UserService _instance = UserService._internal();

  factory UserService() {
    return _instance;
  }

  UserService._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;

  void setUser(User user) {
    _currentUser = user;
  }

  void clearUser() {
    _currentUser = null;
  }
}
