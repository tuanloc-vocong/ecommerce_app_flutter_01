import 'package:flutter/material.dart';

class PaswordTextFormField extends StatelessWidget {
  final bool obserText;
  final String? Function(String?) validator;
  final String name;
  final VoidCallback onTap;
  final Function(String?) onChanged;

  const PaswordTextFormField(
      {super.key,
      required this.obserText,
      required this.validator,
      required this.name,
      required this.onTap,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obserText,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Password",
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              obserText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }
}
