import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qataloog/core/utils/theme.dart';
import 'package:qataloog/presentation/auth/screens/login_screen.dart';

class Qataloog extends StatelessWidget {
  const Qataloog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(484, 1038),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            theme: CustomTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            // theme: AppTheme.lightTheme,
            home: LoginScreen());
      },
      child: const SizedBox(),
    );
  }
}
