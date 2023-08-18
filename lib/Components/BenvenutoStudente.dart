import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/SingleVoto.dart';
import '../Models/Student.dart';
import '../Models/Voto.dart';

class BenvenutoStud extends StatefulWidget {
  BenvenutoStud({Key? key, required this.stud}) : super(key: key);

  final Student stud;
  late Future<List<Voto>> voti;

  @override
  State<BenvenutoStud> createState() => _BenvenutoStudState();
}

class _BenvenutoStudState extends State<BenvenutoStud> {
  @override
  void initState() {
    super.initState();
    widget.voti = widget.stud.getGrades();
    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.voti,
      builder: (context, AsyncSnapshot<List<Voto>> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height - 110,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Benvenuto ${widget.stud.name}!",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Sezione Voti",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    )),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SingleVoto(voto: snapshot.data![index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Text("Errore");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
