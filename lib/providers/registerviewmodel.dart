import 'package:connettion/repositories/register_repository.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  int status = 0;// 0-chuadk, 1-dangdk, 2-dk loi, 3-dk can xm email, 4-dk kg xn email
  String errorMessage = "";
  bool agree = false;
  final registerRepo = RegisterRepository();
  String quydinh = "Khi đăng ký vào ứng dụng các bạn đồng ý điều khoản sau: \n"
    +"1. Các thông tin của bạn sẽ được chia sẽ với các thành học\n"
    +"2. Thông tin của bạn có thể ảnh hưởng học tập ở trường\n"
    +"3. Thông tin của bạn sẽ được xoá vĩnh viễn khi có yêu cầu xoá thông tin";
  void setAgree(bool value){
    agree = value;
    notifyListeners();
  }
  Future<void> register(
      String email, String username, String pass1, String pass2) async{
      
      status = 1;
      notifyListeners();
      errorMessage = "";
      if(agree == false){
        status = 2;
        errorMessage += "Bạn phải đồng ý điều khoản trước khi đăng ký!\n";
      }
      if(email.isEmpty || username.isEmpty || pass1.isEmpty){
        status = 2;
        errorMessage += "Email, tên đăng nhập, mật khẩu không được để trống\n";
      }
      final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&' *+- /=?^_`{1}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      
      if (emailValid == false){
        status = 2;
        errorMessage += "Email không hợp lệ\n";
      }
      if (pass1.length <8){
        status = 2;
        errorMessage += "Tên đăng nhập cần lớn hơn 8 chữ\n";
      }
      if (pass1 != pass2){
        status = 2;
        errorMessage = "Mật khẩu không giống nhau\n";
      }
      if (status !=2)
      status = await registerRepo.register(email, username,pass1);
      //sử dụng repository gọi hàm login và lấy kết quả
      notifyListeners();
  }

}