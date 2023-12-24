import 'package:connettion/providers/forgotviewmodel.dart';
import 'package:connettion/ui/AppConstant.dart';
import 'package:connettion/ui/custom_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_login.dart';

class PageForgot extends StatelessWidget{
  static String routename = "/forgot";
  PageForgot({super.key});
  
  final _emailController = TextEditingController();
  @override
  Widget build (BuildContext context){
    final viewmodel = Provider.of<ForgotViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: 
                viewmodel.status == 3
             ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/tick.gif'),width: 150,),
                SizedBox(height: 25,),
                Text("Đã gửi yêu cầu lấy lại mật khẩu thành công. Truy cập vào email và làm theo hướng dẫn"),
                SizedBox(height: 25,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:() => Navigator.popAndPushNamed(context, PageLogin.routename),
                        child: Text("Bấm vào đây", 
                        style: AppConstant.textlink,),
                        ),
                      Text("để đăng nhập")],
                    )
                ]
              ,)

              :
              Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/thu.GIF'),width: 250,),
                    SizedBox(height: 50,),
                    Text("Hãy điền email để lấy lại mật khẩu."),
                    SizedBox(height: 30,
                      ),
                    CustomerTextField(
                      textController: _emailController,
                      hintText: "Email",
                      obscureText: false),
                    SizedBox(height: 10,),
                    Text(
                      viewmodel.errormessage,
                      style: AppConstant.texterror,
                      ),
                    GestureDetector(
                      onTap: (){
                        final email = _emailController.text.trim();
                        viewmodel.forgotPassword(email);
                        },
                      child: CustomButton(textButton: 'Gửi yêu cầu'
                      ),
                      ),
                      SizedBox(height: 10,),
                    GestureDetector(
                        onTap: () => Navigator.of(context).popAndPushNamed(PageLogin.routename),
                        child: 
                      Text("Đăng nhập >>",style: AppConstant.textlink,),)
                  ],
                ),
                viewmodel.status == 1?CustomSpinner(size: size):Container(),
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}


    