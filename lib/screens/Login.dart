import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/CustomAppBar.dart';
import 'package:prof_and_studends/Components/MyForm.dart';
import 'package:prof_and_studends/Models/User.dart';
import '../Models/Connector.dart';
import '../screens/Home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  List<TextEditingController> ProfControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> StudentControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> labels = ["Nome", "Password"];

  bool loading = false;

  late User user;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Login"),
      body: widget.loading
          ? const CircularProgressIndicator(
              color: Colors.blue,
              value: null,
              strokeWidth: 7.0,
          )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Sei uno Studente?'),
                      MyForm(
                        controllers: widget.StudentControllers,
                        labels: widget.labels,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async => {
                          if (widget.StudentControllers[0].text.isEmpty ||
                              widget.StudentControllers[1].text.isEmpty)
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Inserisci tutti i campi")))
                          else
                            {
                              widget.user = await MyConnector.getStudente(
                                  widget.StudentControllers[0].text,
                                  widget.StudentControllers[1].text),
                              if (widget.user.name != "" &&
                                  widget.user.surname != "")
                                {
                                  setState(() {
                                    widget.loading = true;
                                  }),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text("Sei un Professore?"),
                      MyForm(
                        controllers: widget.ProfControllers,
                        labels: widget.labels,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async => {
                          if (widget.ProfControllers[0].text.isEmpty ||
                              widget.ProfControllers[1].text.isEmpty)
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Inserisci tutti i campi")))
                          else
                            {
                              widget.user = await MyConnector.getProfessore(
                                  widget.ProfControllers[0].text,
                                  widget.ProfControllers[1].text),
                              if (widget.user.name != "" &&
                                  widget.user.surname != "")
                                {
                                  setState(() {
                                    widget.loading = true;
                                  }),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (__) =>
                                              Home(loggedUser: widget.user)))
                                }
                              else
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Professore non trovato")))
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
