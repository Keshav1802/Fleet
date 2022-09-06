import 'package:fleetapp/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:fleetapp/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleet',
      debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
      appBarTheme: Theme.of(context)
          .appBarTheme
          .copyWith(brightness: Brightness.dark),),
      initialRoute: './',
      routes : Routes.buildRoutes,
      home: const RegistrationScreen(),
    );
  }
}

