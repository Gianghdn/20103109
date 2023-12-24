import 'package:connettion/models/profile.dart';
import 'package:connettion/providers/registerviewmodel.dart';
import 'package:connettion/ui/AppConstant.dart';
import 'package:connettion/ui/custom_control.dart';
import 'package:connettion/ui/page_login.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'page_main.dart';

// ignore: must_be_immutable
class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  static String routename = '/register';
  final _usernameControler = TextEditingController();
  final _emailController = TextEditingController();
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();
  bool agree = true;
  @override
  Widget build(BuildContext context) {

    final viewmodel = Provider.of<RegisterViewModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    if (profile.token !=""){// kiểm tra dã đăng nhập chưa
      Future.delayed(Duration.zero,() {
        Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
            builder:(context) => PageMain(),));
      }, );
    }
    return  Scaffold(
      backgroundColor:  Colors.teal[400],//backround
      body: SafeArea(
          child: Center(
        child: 
        
        SingleChildScrollView(

          child:
          viewmodel.status == 1 || viewmodel.status == 4
            ?Column(
              children: [
                Image(image: AssetImage('assets/images/green-tick.gif'),width: 100,),
                Text("Đăng ký thành công!",style: AppConstant.textfancyheader,),
              viewmodel.status == 3? Text("Bạn cần xác nhận email để hoàn thành đăng ký")
                : Text(""),
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
           :Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Applogo(),
                    SizedBox(
                      height: 10,
                    ),
                  Text(
                    'Ánh Sáng Dẫn Lối, ',
                    style: AppConstant.textfancyheader,
                    ), 
                    Text('Khám Phá Bản Năng Đam Mê',
                    style: AppConstant.textfancyheader2,),
                      SizedBox(height: 20,),
                    CustomerTextField( 
                        textController: _emailController, 
                        hintText: "Email", 
                        obscureText: false),
                      SizedBox(height: 10,),
                    CustomerTextField( 
                        textController:_usernameControler, 
                        hintText: "Tên đăng nhập", 
                        obscureText: false),
                      SizedBox(height: 10,),
                    CustomerTextField( 
                        textController: _pass1Controller, 
                        hintText: "Mật khẩu", 
                        obscureText: false),
                      SizedBox(height: 10,),
                    CustomerTextField( 
                        textController: _pass2Controller, 
                        hintText: "Nhập lại mật khẩu", 
                        obscureText: false),
                      SizedBox(height: 10,),
                    Text(viewmodel.errorMessage,
                      style: AppConstant.texterror,),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Checkbox(value: viewmodel.agree, onChanged: (value) {
                      viewmodel.setAgree(value!)  ;
                        },
                      ),
                      Text('Đồng ý'),
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (context) => AlertDialog(title: Text ("Quy định"),
                          content:SingleChildScrollView(child: Text(viewmodel.quydinh)),),);
                        },
                      child: Text('quy định', style: AppConstant.textlink,),)
                    ],
                    ),
                    viewmodel.status == 1? Text(viewmodel.errorMessage, style: TextStyle(color: Colors.white),):Text(""),
                    SizedBox(height: 5,),
                    
                    GestureDetector(
                      onTap:() {
                        final email = _emailController.text.trim();
                        final username = _usernameControler.text.trim();
                        final pass1 = _pass1Controller.text.trim();
                        final pass2 = _pass2Controller.text.trim();
                        viewmodel.register(email, username, pass1, pass2);
                      },
                      child: CustomButton(textButton: 'Đăng ký')),
                    SizedBox(height: 10,),
                    GestureDetector(
                        onTap: () => Navigator.of(context).popAndPushNamed(PageLogin.routename),
                        child: 
                      Text("Đăng nhập >>",style: AppConstant.textlink,),)
                    ]
                  ),
              ),
                viewmodel.status ==1? CustomSpinner(size: size):Container(),

            ],
          ),
        ),
        )),
    );
  }
}