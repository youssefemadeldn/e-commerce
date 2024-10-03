import 'package:e_commerce/config/routes_manager/route_generator.dart';
import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/observer.dart';
import 'package:e_commerce/features/auth/di/di_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Shared Preferences
  await SharedPrefUtils.init();
  var token = SharedPrefUtils.getData('token');
  String r = token == null ? Routes.signInRoute : Routes.mainRoute;

  // Bloc Observer
  Bloc.observer = MyBlocObserver();

  // Dependency Injection
  configureDependencies();

  runApp(MainApp(
    route: r,
  ));
}

class MainApp extends StatelessWidget {
  String route;
  MainApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: route,
      ),
    );
  }
}
