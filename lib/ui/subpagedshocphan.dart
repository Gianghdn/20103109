import 'package:connettion/providers/mainviewmodel.dart';
import 'package:connettion/ui/AppConstant.dart';
import 'package:flutter/material.dart';

class SubPageDanhsachhocphan extends StatelessWidget {
  const SubPageDanhsachhocphan({super.key});
  static int idpage = 5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(color: AppConstant.backgroupcolor,child: Center(child: Text("Danh sách học phần"),)));
  }
}