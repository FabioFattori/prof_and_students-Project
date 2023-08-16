import './User.dart';

class Prof extends User {

  Prof(String name, String surname)
      : super(name, surname);

  factory Prof.fromJson(Map<String, dynamic> json) {
    return Prof(
      json['Nome'],
      json['Cognome'],
    );
  }
}