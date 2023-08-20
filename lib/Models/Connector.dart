import 'dart:convert';
import 'User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'Prof.dart';
import 'Voto.dart';

String _url = "https://understated-throttl.000webhostapp.com/Api";

class MyConnector {
  static Future<User> getStudente(String nome, String password) async {
    var response = await http
        .get(Uri.parse("$_url/Student.php?name=${nome}&p=${password}"));

    dynamic body = jsonDecode(response.body);

    if (response.body != "[]" || body.length != 0) {
      return Student.fromJson(body[0]);
      // return Student(body[0][1], body[0][2]);
    } else {
      return User("", "");
    }
  }

  static Future<User> getProfessore(String nome, String password) async {
    var response =
        await http.get(Uri.parse("$_url/Prof.php?name=${nome}&p=${password}"));

    if (response.body != "<br>    ") {
      dynamic body = jsonDecode(response.body);

      if (response.body != "[]" || body.length != 0) {
        return Prof.fromJson(body[0]);
      } else {
        return User("", "");
      }
    }
    return User("", "");
  }

  static Future<List<Voto>> getGradesForStudent(int id) async {
    var response = await http.get(Uri.parse("$_url/getAllGrades.php?id=${id}"));

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
    var response = await http.get(Uri.parse("$_url/getProfById.php?id=$id"));

    dynamic body = jsonDecode(response.body);

    if (response.body != "[]") {
      return Prof.fromJson(body[0]);
    } else {
      return Prof(-1, "", "", "");
    }
  }

  static Future<List<Student>> getStudentsOfProf(int id) async {
    var response =
        await http.get(Uri.parse("$_url/getAllStudentsOfAProf.php?id=$id"));

    dynamic body = jsonDecode(response.body);

    List<Student> toReturn = [];

    if (response.body != "[]" || body.length != 0) {
      for (var singleStudent in body) {
        toReturn.add(Student.fromJson(singleStudent));
      }
      return toReturn;
    } else {
      return [];
    }
  }

  static void addVoto(double voto , int idProf , int idStudente) async {
     await http.get(Uri.parse("$_url/addVoto.php?voto=$voto&idProf=$idProf&idStudente=$idStudente"));
  }


  static Future<Prof> createProf(String nome,String Cognome,String Materia,String Password){
    return http.get(Uri.parse("$_url/createProf.php?name=$nome&surname=$Cognome&materia=$Materia&p=$Password")).then((value) => Prof.fromJson(jsonDecode(value.body)[0]));
  }

  static Future<Student> createStudent(String nome,String Cognome,String Password){
    return http.get(Uri.parse("$_url/createStudent.php?name=$nome&surname=$Cognome&p=$Password")).then((value) => Student.fromJson(jsonDecode(value.body)[0]));
  }

}
