import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tech_shop_app/view_models/auth_view_model.dart';
import 'package:tech_shop_app/view_models/products_view_model.dart';

import 'components/routes/routes.dart';
import 'data/repositories/admin/products_repository.dart';
import 'data/repositories/auth_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthViewModel(authRepository: AuthRepository(firebaseFirestore: FirebaseFirestore.instance))),
        ChangeNotifierProvider(create: (context)=>ProductsViewModel(productsRepository: ProductsRepository(firebaseFirestore: FirebaseFirestore.instance)))

      ],
      child: MyApp()));
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