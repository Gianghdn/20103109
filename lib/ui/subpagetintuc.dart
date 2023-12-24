import 'package:connettion/providers/mainviewmodel.dart';
import 'package:flutter/material.dart';

import 'AppConstant.dart';

class SubPageTintuc extends StatelessWidget {
  const SubPageTintuc({super.key});
  static int idpage = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(color: const Color.fromARGB(255, 165, 227, 236),child: Center(child: 
        Text("Tin tức",style: AppConstant.textfancyheader4,),)));
  }
}