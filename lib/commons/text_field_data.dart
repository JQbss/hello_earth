import 'package:flutter/material.dart';

class TextFieldData {
  final TextEditingController controller = TextEditingController();

  TextFieldData();

  String get text => controller.text;
}
