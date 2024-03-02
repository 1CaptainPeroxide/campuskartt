import 'package:flutter/material.dart';

class MultiLineTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final TextEditingController controller;
  const MultiLineTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.symmetric(),
       borderRadius: BorderRadius.circular(13),
       boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 79, 76, 76),
          
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(1, 1),
          
        )
      ]),
      padding: EdgeInsets.all(8),
      child: TextFormField(
        maxLines: 5,
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(243, 255, 255, 255),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
