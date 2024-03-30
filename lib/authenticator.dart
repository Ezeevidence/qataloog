import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qataloog/presentation/auth/controller.dart';
import 'package:qataloog/presentation/auth/screens/login_screen.dart';
import 'package:qataloog/presentation/home/screens/home_screen.dart';

class AppAuthenticator extends StatefulWidget {
  const AppAuthenticator({Key? key}) : super(key: key);

  @override
  State<AppAuthenticator> createState() => _AppAuthenticatorState();
}

class _AppAuthenticatorState extends State<AppAuthenticator> {
  @override
  Widget build(BuildContext context) {
    AuthenticationProvider auth = Provider.of<AuthenticationProvider>(context);

    switch (auth.status) {
      case AuthStatus.uninitialized:
        return const LoginScreen();
      case AuthStatus.unauthenticated:
        return const LoginScreen();
      case AuthStatus.authenticated:
        return HomeScreen();
      default:
        return const LoginScreen();
    }
  }
}
