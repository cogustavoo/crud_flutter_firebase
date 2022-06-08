import 'package:crud_firebase_project/routes/app_routes.dart';
import 'package:crud_firebase_project/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'views/home_screen.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'routes',
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (_) => const HomeScreen(),
        AppRoutes.USER_FORM: (_) => UserForm(),
      },
    ),
  );
}
