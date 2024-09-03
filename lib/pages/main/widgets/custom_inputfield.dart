import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField(this.hinttText, this.editingController);
  String hinttText;
  TextEditingController editingController;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: Color(0xfff4f5f9), borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter The Data";
            }
            return null;
          },
          controller: editingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttText,
          ),
        ));
  }
}
