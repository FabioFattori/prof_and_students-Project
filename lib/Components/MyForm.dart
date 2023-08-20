import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/PasswordField.dart';

class MyForm extends StatefulWidget {
  MyForm(
      {Key? key,
      required this.controllers,
      required this.labels,
      this.labelsObscure = const [],
      this.controllersObscure = const [],
      this.width = 300,
      this.height = 350})
      : super(key: key);

  double? width;
  double? height;
  late List<String> labels;
  late List<TextEditingController> controllers;
  late List<String> labelsObscure;
  late List<TextEditingController> controllersObscure;

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (int i = 0; i < widget.labels.length; i++)
              TextField(
                controller: widget.controllers[i],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.labels[i],
                ),
              ),
            for (int i = 0; i < widget.labelsObscure.length; i++)
              PasswordField(label: widget.labelsObscure[i], controller: widget.controllersObscure[i])
          ],
        ));
  }
}
