import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/CustomAppBar.dart';
import 'package:prof_and_studends/Components/MyForm.dart';
import 'package:prof_and_studends/Models/User.dart';
import '../Models/Connector.dart';
import '../screens/Home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  List<TextEditingController> ProfControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> StudentControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  late User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Login"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Sei uno Studente?'),
                MyForm(
                  controllers: StudentControllers,
                  login: true,
                ),
                ElevatedButton.icon(
                  onPressed: () async => {
                    if (StudentControllers[0].text.isEmpty ||
                        StudentControllers[1].text.isEmpty)
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Inserisci tutti i campi")))
                    else
                      {
                        user = await MyConnector.getStudente(
                            StudentControllers[0].text,
                            StudentControllers[1].text),
                        if (user.name != "" && user.surname != "")
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (__) => Home(loggedUser: user)))
                        else
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Studente non trovato")))
                      }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text("Sei un Professore?"),
                MyForm(
                  controllers: ProfControllers,
                  login: true,
                ),
                ElevatedButton.icon(
                  onPressed: () async => {
                    if (ProfControllers[0].text.isEmpty ||
                        ProfControllers[1].text.isEmpty)
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Inserisci tutti i campi")))
                    else
                      {
                        user = await MyConnector.getProfessore(
                            ProfControllers[0].text, ProfControllers[1].text),
                        if (user.name != "" && user.surname != "")
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (__) => Home(loggedUser: user)))
                        else
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Professore non trovato")))
                      }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
