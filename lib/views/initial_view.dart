import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import 'login_view.dart';
import 'mobile_phone/mobile_phone_view.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, viewModel, child) {
      if (!viewModel.isInitialized) {
        return _buildLoading();
      } else {
        return viewModel.isLoggedIn ? const MobilePhoneView() : const LoginView();
      }
    });
  }

  Widget _buildLoading() {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
