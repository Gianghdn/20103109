// ignore: unused_import
//import 'dart:js';

import 'package:connettion/models/profile.dart';
import 'package:connettion/providers/forgotviewmodel.dart';
import 'package:connettion/providers/loginviewmodel.dart';
import 'package:connettion/providers/mainviewmodel.dart';
import 'package:connettion/providers/menubarviewmodel.dart';
import 'package:connettion/providers/profileviewmodel.dart';
import 'package:connettion/providers/registerviewmodel.dart';
import 'package:connettion/services/api_services.dart';
import 'package:connettion/ui/AppConstant.dart';
// ignore: unused_import
import 'package:connettion/ui/page.dklop.dart';
import 'package:connettion/ui/page_forgot.dart';
import 'package:connettion/ui/page_main.dart';
import 'package:connettion/ui/page_register.dart';
// ignore: unused_import
import 'package:connettion/main.dart';
// ignore: unused_import
import 'package:connettion/ui/subpageprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/page_login.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService api = ApiService();
  api.initialize();
  Profile profile = Profile();
  profile.initialize();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(),
      ),
      ChangeNotifierProvider<RegisterViewModel>(
        create: (context) => RegisterViewModel(),
      ),
      ChangeNotifierProvider<ForgotViewModel>(
        create: (context) => ForgotViewModel(),
      ),
      ChangeNotifierProvider<MainViewModel>(
        create: (context) => MainViewModel(),
      ),
      ChangeNotifierProvider<MenuBarViewModel>(
        create: (context) => MenuBarViewModel(),
      ),
      ChangeNotifierProvider<ProfileViewModel>(
        create: (context) => ProfileViewModel(),
      ),
    ],child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => PageMain(),
        '/login': (context) => PageLogin(),
        '/register': (context) => PageRegister(),
        '/forgot': (context) => PageForgot(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.appbarcolor),//màu khung đăng ký
        useMaterial3: true,
      ),
      home:  PageLogin(),
    );
  }

}


