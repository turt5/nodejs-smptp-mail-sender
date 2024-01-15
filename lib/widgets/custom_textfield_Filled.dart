import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:rio_chatbot/values/fonts.dart';

class FilledTextField extends StatelessWidget {
  final double width;
  final double height;
  final Icon iconStart;
  final Icon iconEnd;
  final String hint;

  const FilledTextField(
      {super.key,
      required this.width,
      required this.height,
      required this.iconStart,
      required this.hint,
      required this.iconEnd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xfffffff),
        boxShadow: [
          // BoxShadow(
          //   color: Color(0xE57A7A7A), // Shadow color
          //   spreadRadius: 0.05, // Spread radius
          //   blurRadius: 10, // Blur radius
          //   offset: Offset(0, 2), // Offset in the x, y direction
          // ),
        ],),
      width: width,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(

          hintText: hint,
          labelStyle: const TextStyle(fontFamily: Font.ios_text, fontSize: 14),
          hintStyle:
              const TextStyle(color: Colors.grey, fontFamily: Font.ios_display,fontSize: 14),
          prefixIcon: iconStart,
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
      ).frosted(
          blur: 100,
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}

class FilledPasswordField extends StatefulWidget {
  final double width;
  final double height;
  final Icon iconStart;

  const FilledPasswordField({
    Key? key,
    required this.width,
    required this.height,
    required this.iconStart,
  }) : super(key: key);

  @override
  _FilledPasswordFieldState createState() => _FilledPasswordFieldState();
}

class _FilledPasswordFieldState extends State<FilledPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        margin: const EdgeInsets.only(bottom: 10),
        child: TextField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelStyle: TextStyle(fontFamily: Font.ios_display, fontSize: 14),
              prefixIcon: widget.iconStart,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              hintText: 'Password',
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
                    width: 1
                    ),
              ),
            )).frosted(
          blur: 100,
          borderRadius: BorderRadius.circular(10)
        ));
  }
}
