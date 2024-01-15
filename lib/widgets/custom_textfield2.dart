import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/fonts.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({super.key, required this.hint, required this.width});
  final String hint;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
      ),
      child: TextField(
        decoration: InputDecoration(

          hintText: hint,
          labelStyle: const TextStyle(fontFamily: Font.ios_text, fontSize: 14),
          hintStyle:
          const TextStyle(color: Colors.grey, fontFamily: Font.ios_display,fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.teal,
                width: 1 // Border color when the TextField is focused
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.grey,
                width: 1 // Border color when the TextField is not focused
            ),
          ),
        ),
          // cursorHeight: 30,

      ),
    );
  }
}
