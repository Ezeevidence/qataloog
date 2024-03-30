import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qataloog/app.dart';
import 'package:qataloog/presentation/auth/controller.dart';
import 'package:qataloog/presentation/home/controller.dart';
import 'package:qataloog/presentation/nav_screen/controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationProvider>(
              create: (BuildContext context) {
            return AuthenticationProvider.initialize();
          }),
          ChangeNotifierProvider<NavigationController>(
              create: (BuildContext context) {
            return NavigationController();
          }),
          ChangeNotifierProvider<BooksProvider>(create: (BuildContext context) {
            return BooksProvider();
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Qataloog(),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ));
  }
}
