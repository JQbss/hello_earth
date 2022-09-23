import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/commons/text_field_error.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';

class DataTextField extends StatefulWidget {
  final TextFieldData data;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final void Function(String)? onChanged;

  const DataTextField(
    this.data, {
    required this.hintText,
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  late TextEditingController _textEditingController = widget.data.controller;
  late bool _obscureText;

  bool get shouldValidate => widget.data.isErrorForced ? true : true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextFieldError?>(
        valueListenable: widget.data.validationErrorValueNotifier,
        builder: (context, value, _) {
          final String? errorMessage = 'asdsa'; //shouldValidate && value != null ? value.message(context) : null;
          return TextFormField(
            controller: _textEditingController,
            cursorColor: AppColors.primary,
            validator: true ? (text) => errorMessage : null,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              errorStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.red,
              ),
              labelStyle: TextStyle(
                fontSize: 18,
                color: AppColors.primary,
              ),
              filled: true,
              fillColor: AppColors.textFieldBackground,
              errorMaxLines: 3,
              hintText: widget.hintText,
              suffixIcon: widget.obscureText ? _buildObscureSuffixIcon() : null,
              labelText: widget.labelText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFieldBackground),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            obscureText: _obscureText,
          );
        });
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
