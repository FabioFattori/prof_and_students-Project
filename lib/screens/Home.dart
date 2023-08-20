import 'package:flutter/material.dart';
import 'package:prof_and_studends/Components/BenvenutoProf.dart';
import '../Components/CustomAppBar.dart';
import '../Models/Prof.dart';
import '../Models/Student.dart';
import '../Components/BenvenutoStudente.dart';

class Home extends StatefulWidget {
  Home({Key? key, this.loggedUser}) : super(key: key);

  late dynamic loggedUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Home"),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                widget.loggedUser is Prof
                    ? 
                    BenvenutoProf(prof: widget.loggedUser)
                    : widget.loggedUser is Student
                        ? BenvenutoStud(
                            stud: widget.loggedUser,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text("Benvenuto nella Home!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const Text(
                                  "loggati come Professore o come Studente per accedere ai contenuti!",
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/Login');
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              right: 40, left: 40),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
              ]),
        ));
  }
}
