import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool? obscure;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key, required this.hint, this.onChanged, this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: !obscure!
          ? TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: onChanged)
          : TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: onChanged),
    );
  }
}
