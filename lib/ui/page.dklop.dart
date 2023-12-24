import 'package:connettion/models/lop.dart';
import 'package:connettion/models/profile.dart';
import 'package:connettion/repositories/lop_repository.dart';
import 'package:connettion/repositories/student_repository.dart';
import 'package:connettion/repositories/user_repository.dart';
import 'package:connettion/ui/AppConstant.dart';
import 'package:connettion/ui/custom_control.dart';
import 'package:connettion/ui/page_main.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageDangKyLop extends StatefulWidget {
  PageDangKyLop({super.key});

  @override
  State<PageDangKyLop> createState() => _PageDangKyLopState();
}

class _PageDangKyLopState extends State<PageDangKyLop> {
    List<Lop>? listlop = [];
    Profile profile = Profile();
    String mssv = '';
    String ten = '';
    int idlop = 0;
    String tenlop = '';
  @override
  void initState() {
    // TODO: implement initState
    mssv = profile.student.mssv;
    ten = profile.user.frist_name;
    idlop = profile.student.idlop;
    tenlop = profile.student.tenlop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Thêm thông tin cơ bản ', style: AppConstant.textfancyheader2,),
                SizedBox(height: 10,),
                Text('Khi bạn rời khỏi trang, không thể quay trở lại trang trước. Hãy kiểm tra kỹ trước khi tiếp tục!', style: AppConstant.texterror,),
                SizedBox(height: 20,),
                CustomInputTextFormField(
                  title: "Họ và tên",
                  value: ten,
                  width: size.width,
                  callback: ((output) {
                    ten = output;
                  }),),
                CustomInputTextFormField(
                  title: "Mã sinh viên",
                  value: mssv,
                  width: size.width,
                  callback: ((output) {
                    mssv = output;
                  }),),
                listlop!.isEmpty?
                FutureBuilder(
                  future: LopRepository().getDslop(), 
                  builder: (context,AsyncSnapshot<List<Lop>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData){
                      listlop = snapshot.data;
                      return CustomInputDropDown(width: size.width, 
                      list: listlop!, title: "Lớp", 
                      valueId: idlop, valueName: tenlop, 
                      callback: ((outputId, outputName) {
                        idlop = outputId;
                        tenlop = outputName;
                      }),);
                    } else{
                      return Text('lỗi xảy ra');
                    }
                // ignore: prefer_interpolation_to_compose_strings
                },):CustomInputDropDown(width: size.width, 
                      list: listlop!, title: "Lớp", 
                      valueId: idlop, valueName: tenlop, 
                      callback: ((outputId, outputName) {
                        idlop = outputId;
                        tenlop = outputName;
                      }),),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () async {
                          profile.student.mssv = mssv;
                          profile.student.idlop = idlop;
                          profile.student.tenlop = tenlop;
                          profile.user.frist_name = ten;
                          await UserRepository().updateProfile();
                          await StudentRepository().dangkyLop();
                        },
                        child: CustomButton(textButton: 'Lưu thông tin')),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, PageMain.routename);
                        },
                        child: Text (
                          "Rời khỏi trang >>",
                          style: AppConstant.textlink,),
                      )
            ],),
          )
        ),
      ),
    );
  }
}
