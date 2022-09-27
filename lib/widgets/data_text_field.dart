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

  final void Function(bool)? onFocusChanged;
  final VoidCallback? onSubmitted;

  const DataTextField(
    this.data, {
    required this.hintText,
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onFocusChanged,
    this.onSubmitted,
  });

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late bool _isObscureText;
  bool _hadLostFirstFocus = false;

  bool get shouldValidate =>
      widget.data.isErrorForced ? true : _hadLostFirstFocus;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.data.focusNode..addListener(_onFocusChanged);
    _isObscureText = widget.obscureText;
    _textEditingController = widget.data.controller;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
    setState(() {
      if (!_focusNode.hasFocus) {
        _hadLostFirstFocus = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextFieldError?>(
        valueListenable: widget.data.validationErrorValueNotifier,
        builder: (context, value, _) {
          final String? errorMessage =
              shouldValidate && value != null ? value.message(context) : null;
          return TextFormField(
            autovalidateMode: shouldValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            controller: _textEditingController,
            cursorColor: AppColors.primary,
            focusNode: _focusNode,
            validator: shouldValidate ? (_) => errorMessage : null,
            onChanged: widget.onChanged,
            onFieldSubmitted: (_) => widget.onSubmitted?.call(),
            decoration: _textFormFieldDecoration(),
            obscureText: _isObscureText,
          );
        });
  }

  Widget _buildObscureSuffixIcon() {
    return IconButton(
      icon: Icon(
        _isObscureText ? Icons.visibility_off : Icons.visibility,
        color: AppColors.primary,
      ),
      onPressed: () {
        setState(() {
          _isObscureText = !_isObscureText;
        });
      },
    );
  }

  InputDecoration _textFormFieldDecoration() {
    return InputDecoration(
      errorStyle: TextStyle(
        fontSize: 14.0,
        color: AppColors.error,
      ),
      labelStyle: TextStyle(
        fontSize: 18,
        color: AppColors.primary,
      ),
      filled: true,
      fillColor: AppColors.textFieldBackground,
      errorMaxLines: 3,
      hintText: widget.hintText,
      suffixIcon: _isObscureText ? _buildObscureSuffixIcon() : null,
      labelText: widget.labelText,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBackground),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: _borderStyle(AppColors.primary),
      errorBorder: _borderStyle(AppColors.error),
      focusedErrorBorder: _borderStyle(AppColors.error),
    );
  }

  OutlineInputBorder _borderStyle(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
