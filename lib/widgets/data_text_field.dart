import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';

class DataTextField extends StatefulWidget {
  final TextFieldData data;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const DataTextField(
    this.data, {
    required this.hintText,
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  late TextEditingController _textEditingController = widget.data.controller;

  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 18, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.textFieldBg,
        hintText: widget.hintText,
        suffixIcon: widget.obscureText ? _buildObscureSuffixIcon() : null,
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldBg),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      obscureText: _obscureText,
    );
  }

  Widget _buildObscureSuffixIcon() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: AppColors.primary,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
