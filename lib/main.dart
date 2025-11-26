import 'package:flutter/material.dart';
import 'package:social_media_app/auth/login_or_register.dart';
import 'package:social_media_app/models/social_app_database.dart';
import 'package:social_media_app/theme/dark_mode.dart';
import 'package:social_media_app/theme/light_mode.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SocialAppDatabase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: HomePage()); //LoginOrRegister()
  }
}
