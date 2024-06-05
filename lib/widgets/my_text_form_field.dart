import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String?) validator;
  final String name;
  final Function(String?) onChanged;

  const MyTextFormField(
      {super.key,
      required this.name,
      required this.validator,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: name,
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }
}
