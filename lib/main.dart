import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(392,834),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            
            debugShowCheckedModeBanner: false,
            initialRoute: RouteName.splash,
            onGenerateRoute: AppRoutes.generateRoutes,
          );
        }
    );
  }
}