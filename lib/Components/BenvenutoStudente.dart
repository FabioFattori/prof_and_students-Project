import 'package:flutter/material.dart';
import '../Models/Student.dart';

class BenvenutoStud extends StatefulWidget {
  late dynamic voti;
  BenvenutoStud({Key? key, required this.stud}) : super(key: key) {
    voti = stud.getGrades();
  }

  final dynamic stud;

  @override
  State<BenvenutoStud> createState() => _BenvenutoStudState();
}

class _BenvenutoStudState extends State<BenvenutoStud> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Benvenuto Studente ${widget.stud.name} ${widget.stud.surname}"),
        Text("Hai 0 voti"),
      ],
    );
  }
}
