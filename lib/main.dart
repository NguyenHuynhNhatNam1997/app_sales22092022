import 'package:app_sales22092022/presentation/features/sign_in/sign_in_screen.dart';
import 'package:app_sales22092022/presentation/features/sing_up/sign_up_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/sign-in": (context) => SignInScreen(),
        "/sign-up": (context) => SignUpScreen(),
        // "/home": (context) => HomeScreen(),
        // "/splash": (context) => SplashScreen(),
        // "/cart": (context) => CartScreen(),
      },
      initialRoute: "/sign-in",
    );
  }
}
