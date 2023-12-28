import 'package:flutter/material.dart';

class InputTextFild extends StatelessWidget {
  String hinttext;
  Widget? widget;
  String? Function(String?)? validator;
  TextEditingController? controller;
  String? lebText;
  InputTextFild(
      {super.key,
      required this.hinttext,
      this.widget,
      this.controller,
      this.lebText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: widget == null ? false : true,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hinttext,
          labelText: lebText,
          suffixIcon: widget,
        ),
        validator: validator,
      ),
    );
  }
}
