
import 'package:connettion/models/user.dart';
import 'package:connettion/services/api_services.dart';
// ignore: unused_import
import 'package:dio/dio.dart';

class UserRepository {
  
  Future<User> getUserInfo() async {
    User user = User();
    final response =  await ApiService().getUserInfo(); ;
    if (response != null) {
      var json = response.data['data'];
      user = User.fromJson(json);
      // You can perform additional logic or data manipulation here if needed
    }
    return user;
  }
  Future<bool>updateProfile() async {
    bool kq = false;
    var response = await ApiService().updateProfile();
    if(response !=null){
      kq = true;
      
    }
    return kq;
  }
}
