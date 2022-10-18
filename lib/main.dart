import 'package:flutter/material.dart';
import 'package:ornekler/models/student.dart';
import 'package:ornekler/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

//final Color darkBlue=Color.fromARGB(255,18,32,47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // cupertino
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Yunus Emre", "Geyik", 95,"https://images.freeimages.com/images/premium/previews/2720/27207319-male-student-with-friends-in-background-on-university-campus.jpg"),
    Student.withId(2, "Alice", "Red", 45,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRdSdbPxViU1bzRUa3Zu88LckCDUTCPSn9kJ9Q9C-p4087qlOhbPa1IXrrDI2J26Fp3ZM&usqp=CAU"),
    Student.withId(3, "Alex", "Peace", 25,"https://st3.depositphotos.com/1715570/17966/i/450/depositphotos_179664110-stock-photo-portrait-smiling-male-university-student.jpg")
  ];

  Student selectedStudent=Student.withId(0, "NoBody", "", 0, " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Student Tracking System"),
        ),
        body: buildBody());
  }

  Widget buildBody() {

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder:(BuildContext context, int index){
                         return ListTile(
                           title: Text(students[index].firstName+" "+students[index].lastName),
                           subtitle: Text("Grade on the exam : "+ students[index].grade.toString()+"[ "+students[index].getStatus+" ]"),
                           leading: CircleAvatar(
                             backgroundImage: NetworkImage(students[index].imageUrl),
                           ),
                           trailing: buildsStatusIcon(students[index].grade),
                           onTap: (){
                             setState(() {
                               this.selectedStudent=students[index];
                             });



                           },
                           onLongPress: (){
                             this.selectedStudent=students[index];
                           },
                         );
              }),
        ),
        Text("Selected Student : "+ this.selectedStudent.firstName+" "+ this.selectedStudent.lastName),
        Row(
          children: <Widget>[
             Flexible(
               fit: FlexFit.tight,
               flex: 2,
               child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                  ),
                 child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 5.0,),
                      Text("New Student")
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                  },
               ),
             ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black12,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Update")
                  ],
                ),
                onPressed: () {
                  print("Update");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Delete")
                  ],
                ),
                onPressed: () {
                  print("Delete");
                },
              ),
            )
          ],
        )
      ],
    );

  }

  Widget buildsStatusIcon(int grade) {
    if(grade>=50){
      return Icon(Icons.done);
    }else if(grade>=40){
      return Icon(Icons.album);
    }else{
      return Icon(Icons.clear);
    }

  }
}
