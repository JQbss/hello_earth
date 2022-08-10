import 'package:flutter/material.dart';
import 'package:hello_earth/commons/text_field_data.dart';

class DataTextField extends StatefulWidget {
  final TextFieldData data;

  const DataTextField(
    this.data, {
    super.key,
  });

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  late TextEditingController _textEditingController = widget.data.controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
    );
  }
}
