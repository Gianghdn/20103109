import 'package:connettion/models/profile.dart';
import 'package:connettion/providers/mainviewmodel.dart';
import 'package:connettion/providers/profileviewmodel.dart';
import 'package:connettion/ui/custom_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppConstant.dart';

class SubPageProfile extends StatelessWidget {
  const SubPageProfile({super.key});
  static int idpage = 1;
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ProfileViewModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // -- khởi tạo header -- //
            createHeader(size, profile),
            // end header ,,,,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInputTextFormField(
                        width: size.width * 0.45, 
                        title: 'Số điện thoại', 
                        value: profile.user.phone, 
                        callback: (output){
                          profile.user.phone = output;
                          viewmodel.updatescreen();
                        },
                        type:  TextInputType.phone,),
                      CustomInputTextFormField(
                        width: size.width * 0.45, 
                        title: 'Ngày sinh', 
                        value: profile.user.birthday, 
                        callback: (output){
                          if (AppConstant.isDate(output)){
                            profile.user.birthday = output;
                          }
                          viewmodel.updatescreen();
                        },
                        type: TextInputType.datetime,)
                    ],
                  ),
                ],
              ),
            ),
            
          ],)
    ));
  }

  Container createHeader(Size size, Profile profile) {
    return Container(
            height: size.height*0.20,
            width: double.infinity,
            decoration: BoxDecoration(
              color:  Colors.teal[300],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(children: [
                      Icon(Icons.star, color: Colors.yellow,),
                      Text(
                        profile.student.diem.toString(),
                        style: AppConstant.textbodyw,
                      )
                      ],),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAvatar1(size: size),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.user.frist_name, style: AppConstant.textbodyfocusw,),//tên
                    Row(
                      children: [
                        Text('MSSV: ',style: AppConstant.textbodyw,),
                        Text(profile.student.mssv, style: AppConstant.textbodywbold,)
                      ],
                    ),
                    Row(
                      children: [
                        Text('Học lớp: ',style: AppConstant.textbodyw,),
                        Text(profile.student.tenlop, style: AppConstant.textbodywbold,),
                        profile.student.duyet == 0
                          ?Text(" chưa duyệt ", style: AppConstant.textbodyw,)
                          :Text(''),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Vai trò: ',style: AppConstant.textbodyw,),
                        profile.user.role_id == 4
                          ?Text('Sinh Viên', style: AppConstant.textbodywbold)
                          :Text('Giảng Viên', style: AppConstant.textbodywbold),
                        
                      ],
                    ),
                  ],
                )
                ],
            ),
          );
  }
}

