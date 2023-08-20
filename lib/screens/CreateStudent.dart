import 'package:flutter/material.dart';
import 'package:prof_and_studends/Models/Connector.dart';
import 'package:prof_and_studends/Models/Student.dart';
import 'package:prof_and_studends/screens/Home.dart';
import '../Components/CustomAppBar.dart';
import '../Components/MyForm.dart';

class CreateStudent extends StatelessWidget {
  CreateStudent({super.key});

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> password = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> labels = [
    "Nome",
    "Cognome",
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
                  controllersObscure: password,
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      if (password[0].text == password[1].text) {
                        Student student = await MyConnector.createStudent(
                            controllers[0].text,
                            controllers[1].text,
                            password[0].text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (__) => Home(loggedUser: student))); 
                      }
                    },
                    icon: const Icon(Icons.person_add),
                    label: const Text("Crea Account da studente")),
              ]),
        ],
      ),
    );
  }
}
