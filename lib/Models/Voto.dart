import 'Connector.dart';

class Voto {
  late int id;
  late double voto;
  late String NomeDelProf;
  late String Materia;

  Voto(this.id, this.voto) {
    searchForData();
  }

  factory Voto.fromJson(Map<String, dynamic> json) {
    return Voto(json['id'], json['voto']);
  }

  void searchForData() {
    MyConnector.getProfessoreById(this.id).then((value) {
      this.NomeDelProf = value.name + " " + value.surname;
      this.Materia = value.Materia;
    });
  }
}
