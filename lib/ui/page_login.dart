
import 'package:connettion/ui/AppConstant.dart';
import 'package:connettion/ui/page_forgot.dart';
import 'package:connettion/ui/page_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/loginviewmodel.dart';
import 'custom_control.dart';
import 'page_main.dart';

class PageLogin extends StatelessWidget {
   PageLogin({super.key});
  static String routename = '/login';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if (viewmodel.status == 3){
      Future.delayed(Duration.zero,() {
        Navigator.popAndPushNamed(context,PageMain.routename);
        
      }, );
    }
    return Scaffold(
      backgroundColor:  Colors.teal[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Applogo(),
                    SizedBox(height: 30,),
                    Text('Chào mừng trở lại',
                      style: AppConstant.textfancyheader3,
                    ),
                    Text("Đăng nhập để kết nối!",
                      style: AppConstant.textfancyheader3,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomerTextField(
                      hintText:"Tên đăng nhập", textController: _emailController, obscureText: false,),
                    const SizedBox(height: 25),
                    CustomerTextField(
                      hintText:"Mật khẩu", textController: _passwordController, obscureText: true,),
                    SizedBox(
                      height:20,
                    ),
                    viewmodel.status == 2? Text(viewmodel.errorMessage, style: TextStyle(color: Colors.white),):Text(""),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        String username = _emailController.text.trim();
                        String password= _passwordController.text.trim();
                        viewmodel.login(username, password);
              
                        
                      },
                      child: CustomButton(textButton: "Đăng nhập",),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Bạn chưa có tài khoản?"),
                        GestureDetector(
                          onTap: () => Navigator.of(context).popAndPushNamed(PageRegister.routename),
                          child: Text("Đăng ký", style: TextStyle(
                            fontWeight:FontWeight.bold,color: Colors.purple[800]),),
                        )],),
                        SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () => Navigator.of(context).popAndPushNamed(PageForgot.routename),
                          child: Text(
                            "Quên mật khẩu?",style: AppConstant.textlink),
                        ),
                  ]
                  ,),
              ),
                viewmodel.status == 1? 
                CustomSpinner(size: size): Container(),
            ],
          ),),
        ))
    );
  }
}

