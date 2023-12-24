import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant{
  static TextStyle textbody = 
    TextStyle(fontSize: 16, color:Colors.black);
  static TextStyle textbodyw = 
    TextStyle(fontSize: 16, color:Colors.white);
    static TextStyle textbodywbold = 
    TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white);
  static TextStyle textbodyfocus = 
    TextStyle(fontSize: 20, color:Color.fromARGB(255, 145, 5, 152));
  static TextStyle textbodyfocusw = 
    TextStyle(fontSize: 20, color:Colors.white);
  ///////
  static TextStyle textfancyheader = 
    GoogleFonts.flavors(fontSize: 40,color: Colors.blueGrey[600]);
    static TextStyle textfancyheader4 = 
    GoogleFonts.signikaNegative(fontSize: 25,color: Colors.blueGrey[600]);
  static TextStyle textfancyheader3 = 
    GoogleFonts.pacifico(fontSize: 35,color: const Color.fromARGB(255, 2, 52, 78));
  static TextStyle textfancyheader2 = 
    GoogleFonts.flavors(fontSize: 28,color: Color.fromARGB(255, 26, 99, 3));
    static TextStyle textfancyheader5 = 
    GoogleFonts.pacifico(fontSize: 23,color: const Color.fromARGB(255, 2, 52, 78));
  ////////
  static TextStyle texterror = 
    TextStyle(color: Color.fromARGB(255, 243, 148, 141), fontSize: 16, fontStyle: FontStyle.italic);
  static TextStyle textlink = TextStyle(color:Colors.orange[900], fontSize: 16,);
  ////////
  static const appbarcolor = Color.fromARGB(255, 109, 236, 238);
  static const backgroupcolor = Color.fromARGB(255, 84, 211, 218);
  static bool isDate (String str){
    try{
      var inputFormat = DateFormat('dd/MM/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e){
      print('---loi---');
      return false;
    }
  }
}
