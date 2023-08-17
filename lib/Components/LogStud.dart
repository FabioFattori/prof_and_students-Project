import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/CustomAppBar.dart';
import 'MyForm.dart';
import '../Models/Connector.dart';
import '../Models/User.dart';
import '../screens/Home.dart';

class LogStud extends StatefulWidget {
  LogStud({super.key});

  List<TextEditingController> StudentControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> labels = ["Nome", "Password"];
  dynamic user;

  @override
  State<LogStud> createState() => _LogStudState();
}

class _LogStudState extends State<LogStud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Benvenuto Studente'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MyForm(
                  controllers: widget.StudentControllers,
                  labels: widget.labels,
                ),
                ElevatedButton.icon(
                  onPressed: () async => {
                    if (widget.StudentControllers[0].text.isEmpty ||
                        widget.StudentControllers[1].text.isEmpty)
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Inserisci tutti i campi")))
                    else
                      {
                        widget.user = await MyConnector.getStudente(
                            widget.StudentControllers[0].text,
                            widget.StudentControllers[1].text),
                        if (widget.user.name != "" && widget.user.surname != "")
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (__) =>
                                        Home(loggedUser: widget.user)))
                          }
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
          ],
        ),
      ),
    );
  }
}
