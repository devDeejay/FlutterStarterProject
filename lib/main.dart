import 'package:flutter/material.dart';
import 'package:starter_app/router/router.dart';
import 'package:starter_app/services/navigation_service.dart';
import 'package:starter_app/utils/di.dart';

void main() {
  setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beginner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => child,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
