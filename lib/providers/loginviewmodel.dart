import 'package:connettion/models/student.dart';
import 'package:connettion/models/user.dart';
import 'package:connettion/repositories/login_repository.dart';
import 'package:connettion/repositories/student_repository.dart';
import 'package:connettion/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier{
  String errorMessage = "";
  int status = 0; // 0 - not login, 1 - waiting, 2 - error, 3 - already login
  LoginRepository loginRepo = LoginRepository();
  Future<void> login(String username, String password) async {
    status = 1;
    notifyListeners();
    try{
      var profile = await loginRepo.login(username, password);
      if(profile.token == ""){
        status = 2;
        errorMessage = "Tên đăng nhập hoặc mất khẩu không đúng! ";
        } else {
        
        //đăng nhập thành công, lấy thông tin user student
        var student = await StudentRepository().getStudentInfo();
        profile.student = Student.fromStudent(student);
        var user = await UserRepository().getUserInfo();
        profile.user = User.fromUser(user);
        status = 3;
      }
      notifyListeners();
    }
    catch(e){}
  }
}

