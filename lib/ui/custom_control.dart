import 'package:connettion/models/lop.dart';
import 'package:connettion/models/profile.dart';
import 'package:connettion/ui/AppConstant.dart';
import 'package:flutter/material.dart';

class CustomInputDropDown extends StatefulWidget {
  CustomInputDropDown({
    super.key,
     required this.width, required this.title, 
     required this.valueId,
     required this.valueName,
    required this.callback, required this.list,
  });

  
  final double width;
  final String title;
  final int valueId;
  final String valueName;
  final List<Lop> list;
  final Function (int outputId,String outputName) callback;

  @override
  State<CustomInputDropDown> createState() => _CustomInputDropDownState();
}

class _CustomInputDropDownState extends State<CustomInputDropDown> {
  int status = 0;
  int outputId = 0;
  String outputName = "";
  @override
  void initState() {
    // TODO: implement initState
    outputId = widget.valueId;
    outputName = widget.valueName;
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppConstant.textbodyfocus),
        status == 0?
        GestureDetector(
          onTap:() {
            setState(() {
              status = 1;
            });
          },
          child: Text(
            outputName == "" ? "không có": outputName, 
            style: AppConstant.textfancyheader5),
        )
          :Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:Colors.cyan[300],),
            width:  widget.width - 25,
            child: DropdownButton(value: outputId,
            items: widget.list.map((e) => DropdownMenuItem(
              value: e.id
              ,child: Container(
                width: widget.width * 0.8,
                decoration: BoxDecoration(color: Colors.purple[200]),
                child: Text(e.ten, overflow:  TextOverflow.ellipsis
                ,)))).toList(),
              onChanged: (value) {
                setState(() {
                  outputId = value!;
                  for (var dropitem in widget.list){
                    if (dropitem.id == outputId){
                      outputName = dropitem.ten;
                    widget.callback(outputId, outputName);
                    break;
                    }
                    
                  }
                  status = 0;
                }
                );
              },
              
              )
              
              
              ),
        Divider(thickness: 1,)],);
  }
}
class CustomInputTextFormField extends StatefulWidget {
  CustomInputTextFormField({
    super.key,
     required this.width, required this.title, required this.value, required this.callback,
     this.type = TextInputType.text,
  });

  
  final double width;
  final String title;
  final String value;
  final TextInputType type;
  final Function (String output) callback;

  @override
  State<CustomInputTextFormField> createState() => _CustomInputTextFormFieldState();
}

class _CustomInputTextFormFieldState extends State<CustomInputTextFormField> {
  int status = 0;
  String output = "";
  @override
  void initState() {
    // TODO: implement initState
    output = widget.value;
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: AppConstant.textbodyfocus),
          status == 0?
          GestureDetector(
            onTap:() {
              setState(() {
                status = 1;
              });
            },
            child: Text(
              output == "" ? "không có": output, 
              style: AppConstant.textfancyheader5),
          )
            :Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:Colors.cyan[300],),
                  width:  widget.width - 50,
                  child: TextFormField(
                    keyboardType: widget.type,
                    decoration: InputDecoration(border: InputBorder.none),
                    initialValue: output,
                    onChanged: (value){
                      setState(() {
                        output = value;
                        widget.callback(output);
                      });
                      
                    },
                    )),
                GestureDetector(
                  onTap:() {
                    setState(() {
                      status = 0;
                      widget.callback(output);
                    });
                  },
                  child: Icon(Icons.save, size: 18,))
              ],
            ),
          Divider(thickness: 1,)],),
    );
  }
}
class CustomAvatar1 extends StatelessWidget {
  const CustomAvatar1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(size.height * 0.25),
    child: Container(
      width: 100,
      height: 100,
      child: Image.network(
        Profile().user.avatar,
        fit: BoxFit.cover,)),
                  );
  }
}
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.textButton,
  });
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      decoration: 
          BoxDecoration(color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
          ),
        child:  Center(
          child: Text(textButton, 
          style: TextStyle(
            color: Color.fromARGB(255, 228, 225, 219), 
            fontSize: 16,
            fontWeight: FontWeight.bold),),
        ),
    );
  }
}

class CustomerTextField extends StatelessWidget {
  CustomerTextField({
    super.key,
    required TextEditingController textController, 
    required this.hintText, required this.obscureText,
  }) : _textController = textController;

  final TextEditingController _textController;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 176, 238, 239),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromARGB(255, 223, 115, 167))),
      child: TextField(
        obscureText: obscureText,
        controller: _textController,
        decoration: InputDecoration(
          border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}
class Applogo extends StatelessWidget {
  const Applogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.auto_stories, size: 100,color: Colors.pink[900]);//icon logo
  }
}
class CustomSpinner extends StatelessWidget {
  const CustomSpinner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Color.fromARGB(255, 243, 208, 208).withOpacity(0.5),
      child: Center(
        child: Image(
          width: 100,
          image: AssetImage('assets/images/giphy.gif')),
      ),
    );
  }
}





