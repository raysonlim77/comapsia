import 'package:compasia/services/auth_service.dart';
import 'package:compasia/services/share_preferences_service.dart';
import 'package:compasia/view_models/login_view_model.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:provider/provider.dart';

import 'view_models/mobile_phone_editor_view_model.dart';
import 'view_models/mobile_phone_view_model.dart';
import 'views/initial_view.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => MobilePhoneViewModel()),
        ChangeNotifierProvider(
            create: (context) => MobilePhoneEditorViewModel()),
      ],
      child: MaterialApp(
        title: 'Compasia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
         navigatorKey: navigatorKey,
        home: const InitialView()
      ),
    );
  }
}

void initializeApp() async {
  // UserService(); // Initialize the UserService
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  await AuthService().init();
}
