import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/StudentCard.dart';
import 'package:prof_and_studends/Models/Prof.dart';
import 'package:prof_and_studends/Models/Student.dart';
import 'package:prof_and_studends/screens/AddGradeToStud.dart';
import 'package:prof_and_studends/screens/CreateProf.dart';
import 'package:prof_and_studends/screens/CreateStudent.dart';
import 'package:prof_and_studends/screens/Login.dart';
import 'screens/Home.dart';
import 'Components/ProfLog.dart';
import 'Components/LogStud.dart';

class RouteGenerator {
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());

      case '/Login':
        return MaterialPageRoute(builder: (_) => Login());

      case '/LogProf':
        return MaterialPageRoute(builder: (_) => ProfLog());

      case '/LogStud':
        return MaterialPageRoute(builder: (_) => LogStud());

      case '/CreateStud':
        return MaterialPageRoute(builder: (_) => CreateStudent());
      case '/CreateProf':
        return MaterialPageRoute(builder: (_) => CreateProf());

      case '/addVoto':
        
        if (args is toPassObject) {
          return MaterialPageRoute(
            builder: (_) => AddGrade(student: args.student, prof: args.prof),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }
}
