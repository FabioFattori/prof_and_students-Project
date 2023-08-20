import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/CustomAppBar.dart';
import 'package:prof_and_studends/Models/Prof.dart';
import 'package:prof_and_studends/Models/Voto.dart';
import '../Components/MyForm.dart';
import '../Models/Student.dart';

class AddGrade extends StatelessWidget {
  AddGrade({Key? key, required this.student,required this.prof}) : super(key: key);
  final Prof prof;
  final Student student;
  late Voto voto;
  TextEditingController ProfControllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Aggiungi Voto per ${student.name}"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MyForm(
                controllers: [ProfControllers],
                labels: const ["Voto"],
                height: 100,
              ),
              ElevatedButton.icon(
                onPressed: () async => {
                  if (ProfControllers.text.isEmpty)
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Inserisci tutti i campi")))
                  else
                    {
                      if (int.tryParse(ProfControllers.text) == null)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("inserisci un voto valido")))
                        }
                      else
                        {
                          voto = Voto.withoutId(
                              double.parse(ProfControllers.text),
                              student.id,
                              prof.id),
                          voto.searchForData(),
                          showCupertinoModalPopup(context: context, builder: (context) => CupertinoAlertDialog(
                            title: const Text("Voto aggiunto"),
                            content: const Text("Il voto è stato aggiunto correttamente"),
                            actions: [
                              CupertinoDialogAction(onPressed: ()=>{
                                Navigator.pop(context),
                                Navigator.pop(context)
                                }, child: const Text("OK"))
                            ],),),
                            
                        }
                    }
                },
                icon: const Icon(Icons.add),
                label: const Text("Aggiungi"),
              ),
            ],
          ),
        ));
  }
}
