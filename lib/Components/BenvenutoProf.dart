import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/StudentCard.dart';
import '../Models/Prof.dart';
import '../Models/Connector.dart';
import '../Models/Student.dart';

class BenvenutoProf extends StatefulWidget {
  BenvenutoProf({Key? key, required this.prof}) : super(key: key);

  final Prof prof;

  @override
  State<BenvenutoProf> createState() => _BenvenutoProfState();
}

class _BenvenutoProfState extends State<BenvenutoProf> {
  late List<Student> studenti;

  late Future<List<Student>> studentiFuture;

  TextEditingController _searchValue = TextEditingController();

  late List<Student> AllStudent;

  @override
  void initState() async {
    super.initState();
    studentiFuture = MyConnector.getStudentsOfProf(widget.prof.id);
    studenti = await studentiFuture;
    AllStudent = studenti;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            border: UnderlineInputBorder(),
            labelText: 'Cerca per nome e/o cognome tra i tuoi studenti...',
          ),
          controller: _searchValue,
          onChanged: (String value) async {
            if (value == "" || value == " ") {
              setState(() {
                studenti = AllStudent;
              });
            } else {
              setState(() {
                studenti = AllStudent.where((singleobject) =>
                    singleobject.name
                        .toLowerCase()
                        .contains(value.toLowerCase()) ||
                    singleobject.surname
                        .toLowerCase()
                        .contains(value.toLowerCase())).toList();
              });
            }
          },
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "I tuoi studenti:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder(
            future: studentiFuture,
            builder: (context, AsyncSnapshot<List<Student>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  shrinkWrap: true,
                  itemCount: studenti.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      key: UniqueKey(),
                        padding: const EdgeInsets.all(8.0),
                        child: StudentCard(
                          StudentData: studenti[index],
                        ));
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Errore: ${snapshot.error}");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })
      ],
    );
  }
}
