
// ignore: unused_import
import 'package:connettion/models/profile.dart';
import 'package:connettion/models/student.dart';
import 'package:connettion/services/api_services.dart';

class StudentRepository {
  final ApiService api = ApiService(); // replace with your API URL
  Future<bool>dangkyLop() async {
    bool kq = false;
    var response = await api.dangkyLop();
    if(response !=null){
      kq = true;
      
    }
    return kq;
  }
  Future<Student>getStudentInfo() async {
    Student student = Student();
    var response = await api.getStudentInfo();
    if(response !=null){
      var data = response.data;
      student = Student.fromJson(data);
      //Profile().student = Student.fromStudent(student);
    }
    return student;
  }

}
