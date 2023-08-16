import 'package:flutter/material.dart';
import 'package:prof_and_studends/screens/Login.dart';
import 'screens/Home.dart';
import 'Models/User.dart';

class RouteGenerator{

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body:const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) =>  Home());
      case '/Login':
        return MaterialPageRoute(builder: (_) => Login());
      
      default:
        return _errorRoute();
    }
  }
}