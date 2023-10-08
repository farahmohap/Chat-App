import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText,this.onChanged});
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          helperStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            //not focused
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
              //general
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
