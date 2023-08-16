import 'dart:convert';

import 'package:prof_and_studends/Models/Voto.dart';

import './User.dart';
import 'Connector.dart';

class Student extends User {
  late int id;
  Student(String name, String surname,this.id) : super(name, surname);

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
     //converto json['id'] to int
     json['Nome'],
      json['Cognome'],
      json['id'],
    );
  }

  Future<List<Voto>> getGrades() async {
    return await MyConnector.getGradesForStudent(id);
  }
}
