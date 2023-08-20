import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/StudentCard.dart';
import '../Models/Prof.dart';
import '../Models/Connector.dart';
import '../Models/Student.dart';

class BenvenutoProf extends StatefulWidget {
  BenvenutoProf({Key? key, required this.prof}) : super(key: key);

  final Prof prof;

  late Future<List<Student>> studentiFuture;

  TextEditingController _searchValue = TextEditingController();
  late List<Student> studenti;
  late List<Student> AllStudent;
  @override
  State<BenvenutoProf> createState() => _BenvenutoProfState();
}

class _BenvenutoProfState extends State<BenvenutoProf> {
  void setVars() async {
    widget.studenti = await widget.studentiFuture;
    widget.AllStudent = widget.studenti;
  }

  @override
  void initState() {
    super.initState();
    widget.studentiFuture = MyConnector.getStudentsOfProf(widget.prof.id);
    setVars();
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
          controller: widget._searchValue,
          onChanged: (String value) async {
            if (value == "" || value == " ") {
              setState(() {
                widget.studenti = widget.AllStudent;
              });
            } else {
              setState(() {
                widget.studenti = widget.AllStudent.where((singleobject) =>
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
             future: widget.studentiFuture,
             builder: (context, AsyncSnapshot<List<Student>> snapshot) {
               if (snapshot.hasData) {
                 return GridView.builder(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 3),
                   shrinkWrap: true,
                   itemCount: widget.studenti.length,
        
                   itemBuilder: (context, index) {
                     return Padding(
                       key: UniqueKey(),
                         padding: const EdgeInsets.all(8.0),
                         child: StudentCard(
                           StudentData: widget.studenti[index],
                           prof: widget.prof,
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
    ;
  }
}
