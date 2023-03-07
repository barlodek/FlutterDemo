import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.onChanged,
      this.style,
      this.padding,
      this.secured});

  final String label;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final bool? secured;

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      obscureText: secured ?? false,
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
      style: style,
    );
    return padding != null
        ? Padding(
            padding: padding as EdgeInsetsGeometry,
            child: textField,
          )
        : textField;
  }
}
