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
  ];

  List<TextEditingController> password = [
    TextEditingController(),
    
  ];

  List<String> labels = ["Nome"];
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
                  labelsObscure: ["Password"],
                  controllersObscure: widget.password,
                  height: 200,
                ),
                ElevatedButton.icon(
                  onPressed: () async => {
                    if (widget.StudentControllers[0].text.isEmpty ||
                        widget.password[0].text.isEmpty)
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Inserisci tutti i campi")))
                    else
                      {
                        widget.user = await MyConnector.getStudente(
                            widget.StudentControllers[0].text,
                            widget.password[0].text),
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
