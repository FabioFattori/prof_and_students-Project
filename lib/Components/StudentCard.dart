import 'package:flutter/material.dart';
import 'package:prof_and_studends/Models/Prof.dart';
import '../Models/Student.dart';

class StudentCard extends StatelessWidget {
  StudentCard({Key? key, required this.StudentData,required this.prof}) : super(key: key);
  late Prof prof;
  late Student StudentData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: UniqueKey(),
      width: 60,
      height: 60,
      child: Card(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Padding(padding: const EdgeInsets.all(8.0), child: Text("${StudentData.name} ${StudentData.surname}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: IconButton(onPressed: ()=>{
                    Navigator.pushNamed(context, '/addVoto',arguments: toPassObject(StudentData,prof))
                  }, icon: const Icon(Icons.add,color: Colors.white,)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class toPassObject {
  Student student;
  Prof prof;
  toPassObject(this.student,this.prof);
}
