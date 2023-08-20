import 'Connector.dart';

class Voto {
  late int id;
  late double voto;
  late String NomeDelProf = "";
  late String Materia = "";
  late int IDProf;

  Voto(this.id, this.voto);

  Voto.createThenSearch(
      this.id, this.voto, this.IDProf, this.NomeDelProf, this.Materia);

  factory Voto.fromJson(Map<String, dynamic> json) {
    return Voto.createThenSearch(json['id'], json['Voto'] + 0.0,
        json['ID_Prof'], "${json["Nome"]} ${json["Cognome"]}", json["Materia"]);
  }

  Voto.withoutId(this.voto, this.IDProf, int idStudente) {
    MyConnector.addVoto(voto, IDProf, idStudente);
  }

  void searchForData() {
    MyConnector.getProfessoreById(IDProf).then((value) {
      NomeDelProf = "${value.name}  ${value.surname}";
      Materia = value.Materia;
    });
  }
}
