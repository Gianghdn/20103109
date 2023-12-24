import 'package:flutter/material.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SubPageDanhsachlop extends StatelessWidget {
  const SubPageDanhsachlop({super.key});
  static int idpage = 4;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(color:Colors.indigo[300],child: Center(child: 
        Text("Danh sách lớp", style: AppConstant.textfancyheader4,),)));
  }
}
