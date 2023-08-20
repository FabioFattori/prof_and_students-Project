import 'package:flutter/material.dart';
import 'package:prof_and_studends/Models/Connector.dart';
import 'package:prof_and_studends/Models/Prof.dart';
import 'package:prof_and_studends/screens/Home.dart';
import '../Components/CustomAppBar.dart';
import '../Components/MyForm.dart';

class CreateProf extends StatelessWidget {
  CreateProf({super.key});

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> passwords = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> labels = [
    "Nome",
    "Cognome",
    "Materia",
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
                  labelsObscure: const ["Password", "Conferma Password"],
                  controllersObscure: passwords,
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      if (passwords[0].text == passwords[1].text) {
                        Prof prof = await MyConnector.createProf(
                            controllers[0].text,
                            controllers[1].text,
                            controllers[2].text,
                            passwords[0].text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (__) => Home(loggedUser: prof)));
                      }
                    },
                    icon: const Icon(Icons.person_add),
                    label: const Text("Crea Account da professore")),
              ]),
        ],
      ),
    );
  }
}
