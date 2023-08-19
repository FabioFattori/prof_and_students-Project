import 'package:flutter/material.dart';
import '../Components/CustomAppBar.dart';
import '../Components/MyForm.dart';

class CreateProf extends StatelessWidget {
  CreateProf({super.key});

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> labels = [
    "Nome",
    "Cognome",
    "Materia",
    "Password",
    "Conferma Password",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Crea Account Studente"),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyForm(
                  controllers: controllers,
                  labels: labels,
                ),
                ElevatedButton.icon(
                    onPressed: () => {},
                    icon: const Icon(Icons.person_add),
                    label: const Text("Crea Account da professore")),
              ]),
        ],
      ),
    );
  }
}
