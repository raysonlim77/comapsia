import 'package:flutter/material.dart';

import '../services/auth_service.dart';
class LoginViewModel extends ChangeNotifier {
bool _isLoading = false;
  bool _obsecureText = true;
  bool get obsecureText => _obsecureText;
  setObsecureText() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(
    BuildContext context,
  ) async {
    FocusScope.of(context).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      return;
    }
    _isLoading = true;
    notifyListeners();
    await AuthService()
        .login(email: emailController.text, password: passwordController.text);

    _isLoading = false;
    notifyListeners();
  }

}
