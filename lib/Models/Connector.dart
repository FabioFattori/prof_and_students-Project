import 'dart:convert';
import 'User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'Prof.dart';
import 'Voto.dart';

class MyConnector {
  static Future<User> getStudente(String nome, String password) async {
    var response = await http.get(Uri.parse(
        "http://192.168.14.1/prof_and_students_back-Project/Api/Student.php?name=${nome}&p=${password}"));

    dynamic body = jsonDecode(response.body);

    if (response.body != "[]" || body != null) {
      return Student.fromJson(body[0]);
      // return Student(body[0][1], body[0][2]);
    } else {
      return User("", "");
    }
  }

  static Future<User> getProfessore(String nome, String Cognome) async {
    var response = await http.get(Uri.parse(
        "http://192.168.14.1/prof_and_students_back-Project/Api/Prof.php?name=${nome}&surname=${Cognome}"));

    dynamic body = jsonDecode(response.body);

    if (response.body != "[]") {
      return Prof.fromJson(body[0]);
    } else {
      return User("", "");
    }
  }

  static Future<List<Voto>> getGradesForStudent(int id) async {
    var response = await http.get(Uri.parse(
        "http://192.168.14.1/prof_and_students_back-Project/Api/getAllGrades.php?id=${id}"));

    dynamic body = jsonDecode(response.body);

    List<Voto> toReturn = [];

    if (response.body != "[]") {
      for (var singleGrade in body) {
        toReturn.add(Voto.fromJson(singleGrade));
      }
      return toReturn;
    } else {
      return [];
    }
  }

  static Future<Prof> getProfessoreById(int id) async {
    var response = await http.get(Uri.parse(
        "http://192.168.14.1/prof_and_students_back-Project/Api/getProfById.php?id=$id"));

    dynamic body = jsonDecode(response.body);

    if (response.body != "[]") {
      return Prof.fromJson(body[0]);
    } else {
      return Prof("", "","");
    }
  }
}
