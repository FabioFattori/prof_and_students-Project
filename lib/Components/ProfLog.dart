import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/CustomAppBar.dart';
import 'MyForm.dart';
import '../Models/Connector.dart';
import '../Models/User.dart';
import '../screens/Home.dart';

class ProfLog extends StatefulWidget {
  ProfLog({super.key});

  List<TextEditingController> ProfControllers = [
    TextEditingController(),
  ];
   List<TextEditingController> password = [
    TextEditingController(),
  ];

  List<String> labels = ["Nome"];

  dynamic user;

  @override
  State<ProfLog> createState() => _ProfLogState();
}

class _ProfLogState extends State<ProfLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Benvenuto Professore"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyForm(
              controllers: widget.ProfControllers,
              labels: widget.labels,
              labelsObscure: [ "Password"],
              controllersObscure: widget.password,
              height: 200,
            ),
            ElevatedButton.icon(
              onPressed: () async => {
                if (widget.ProfControllers[0].text.isEmpty ||
                    widget.password[0].text.isEmpty)
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Inserisci tutti i campi")))
                else
                  {
                    widget.user = await MyConnector.getProfessore(
                        widget.ProfControllers[0].text,
                        widget.password[0].text),
                    if (widget.user.name != "" && widget.user.surname != "")
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (__) => Home(loggedUser: widget.user)))
                      }
                    else
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Professore non trovato")))
                  }
              },
              icon: const Icon(Icons.login),
              label: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
