import 'dart:convert';
import 'User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Student.dart';
import 'Prof.dart';

class MyConnector{

  
  static Future<User> getStudente(String nome, String Cognome) async{
    var response = await http.get(Uri.parse("http://localhost/prof_and_students_back/Api/Student.php?name=${nome}&surname=${Cognome}"));

    dynamic body = jsonDecode(response.body);

    if(response.body!="[]"){
      return Student.fromJson(body[0]);
      // return Student(body[0][1], body[0][2]);
    }else{
      return User("", "");
    }
  }

  static Future<User> getProfessore(String nome, String Cognome) async{
    var response = await http.get(Uri.parse("http://localhost/prof_and_students_back/Api/Prof.php?name=${nome}&surname=${Cognome}"));

    dynamic body = jsonDecode(response.body);

    if(response.body!="[]"){
      return Prof.fromJson(body[0]);
    }else{
      return User("", "");
    }
  }

  static Future<http.Response> post(String url, Map<String, String> body) async{
    return await http.post(Uri.parse(url), body: body);
  }

}