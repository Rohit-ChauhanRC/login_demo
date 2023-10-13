import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isObscure;
  final String? initialValue;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final void Function()? onTap;
  final bool readOnly;

  const TextFormWidget({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.validator,
    this.controller,
    this.isObscure = false,
    this.onSaved,
    this.onChanged,
    this.initialValue,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.onTap,
    this.readOnly = false,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        initialValue: initialValue ?? "",
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        obscureText: isObscure,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          contentPadding: EdgeInsets.all(12),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: border,
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
        ),
      ),
    );
  }
}
