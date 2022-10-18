class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;
  late String imageUrl;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id, String firstName, String lastName, int grade,String imageUrl) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.imageUrl=imageUrl;
  }

  String get getStatus{
    String message= "";
    if(this.grade>=50){
      message="Pass";
    }else if(this.grade>=40){
      message="Make-up Exam";
    }else{
      message="Fail";
    }

    this.status=message;
    return this.status;
  }
}
