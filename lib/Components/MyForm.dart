import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  MyForm({Key? key, required this.controllers, required this.labels,this.width =300 ,this.height=350})
      : super(key: key);

  double? width;
  double? height;
  late List<String> labels;
  late List<TextEditingController> controllers;

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
          ],
        ));
  }
}
