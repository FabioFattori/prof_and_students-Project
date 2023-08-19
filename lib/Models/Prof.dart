import './User.dart';

class Prof extends User {
  late String Materia;
  late int id;
  Prof(this.id,String name, String surname,this.Materia)
      : super(name, surname);

  factory Prof.fromJson(Map<String, dynamic> json) {
    return Prof(
      json['id'],
      json['Nome'],
      json['Cognome'],
      json['Materia'],
    );
  }
}