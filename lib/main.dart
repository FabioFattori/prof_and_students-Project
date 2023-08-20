import 'package:flutter/material.dart';

import "RouteGenerator.dart";
import 'screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prof&Students',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
