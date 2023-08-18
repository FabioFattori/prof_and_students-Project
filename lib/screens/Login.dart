import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/CustomAppBar.dart';
import 'package:prof_and_studends/Components/MyForm.dart';
import 'package:prof_and_studends/Models/User.dart';
import '../Models/Connector.dart';
import '../screens/Home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  List<Button> buttons = [
    Button(
        onPressedDirection: '/LogStud',
        icon: const Icon(Icons.person),
        label: const Text("Sei uno Studente con un account? Loggati!")),
    Button(
        onPressedDirection: '/LogProf',
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text("Sei un Professore con un account? Loggati!")),
    Button(
        onPressedDirection: '/',
        icon: const Icon(Icons.person_add),
        label: const Text("Crea il tuo account da Studente")),
    Button(
        onPressedDirection: '/',
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text("Crea il tuo account da Professore")),
  ];

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Login"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ElevatedButton.icon(
                        onPressed: () => {
                              Navigator.pushNamed(context,
                                  widget.buttons[index].onPressedDirection)
                            },
                        icon: widget.buttons[index].icon,
                        label: widget.buttons[index].label);
                  },
                  itemCount: widget.buttons.length,
                ),
              ],
            ),
          ),
        ));
  }
}

class Button {
  Button(
      {required this.icon,
      required this.label,
      required this.onPressedDirection});
  final Icon icon;
  final Text label;
  final String onPressedDirection;
}
