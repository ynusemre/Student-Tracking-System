
import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentAdd extends StatefulWidget{
  List<Student> students;

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
   return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd>{
  final _formKey=GlobalKey<FormState>();
  Student student=Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text ("New Student"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildImageUrlField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student First Name",hintText: "Yunus Emre"),
      onSaved: (value)  {
         this.student.firstName=value!;

      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Last Name",hintText: "Geyik"),
      onSaved: ( value){
        this.student.lastName=value!;

      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Grade",hintText: "65"),
      onSaved: ( value){
        this.student.grade=int.parse(value!);
      },
    );
  }

  Widget buildImageUrlField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Image Url",hintText: ".jpg"),
      onSaved: (value){
        this.student.imageUrl=value!;

      },
    );
  }

  Widget buildSubmitButton(){
    return ElevatedButton(
        child: Text("Save"),
        onPressed: (){
          _formKey.currentState!.save();
          widget.students.add(student);
          Navigator.pop(context);
        },

    );
  }

}
