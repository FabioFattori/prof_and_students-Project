import './User.dart';

class Student extends User {

  Student(String name, String surname)
      : super(name, surname);

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['Nome'],
      json['Cognome'],
    );
  }
}
