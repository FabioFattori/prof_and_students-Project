import 'package:flutter/material.dart';
import '../Components/CustomAppBar.dart';
import "../Models/User.dart";
import '../Models/Prof.dart';
import '../Models/Student.dart';

class Home extends StatefulWidget {
  Home({Key? key, this.loggedUser}) : super(key: key);

  late dynamic loggedUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(widget.loggedUser.runtimeType);

    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.loggedUser is Prof
              ? Text(
                  "Benvenuto Professore ${widget.loggedUser.name} ${widget.loggedUser.surname}")
              : widget.loggedUser is Student
                  ? Text(
                      "Benvenuto Studente ${widget.loggedUser.name} ${widget.loggedUser.surname}")
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text("Benvenuto nella Home!"),
                        Text(
                            "loggati come Professore o come Studente per accedere ai contenuti!"),
                      ],
                    ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login');
            },
            child: const Text('Login'),
          ),
        ],
      )),
    );
  }
}
