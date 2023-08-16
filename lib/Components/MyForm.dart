import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  MyForm({Key? key, required this.controllers , this.login = false}) : super(key: key);

  late bool login;
  late List<TextEditingController> controllers;

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.controllers.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: TextFormField(
                  maxLength: 20,
                  controller: widget.controllers[index],
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: widget.login ? index%2==0 ? "inserisci il tuo nome" : "inserisci il tuo cognome" :  "Campo ${index + 1}",
                  ),
                ));
          }),
    );
  }
}
