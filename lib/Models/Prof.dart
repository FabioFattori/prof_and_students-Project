import './User.dart';

class Prof extends User {
  late String Materia;
  Prof(String name, String surname,this.Materia)
      : super(name, surname);

  factory Prof.fromJson(Map<String, dynamic> json) {
    return Prof(
      json['Nome'],
      json['Cognome'],
      json['Materia'],
    );
  }
}