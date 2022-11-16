import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  Color? _color;

  AppProgressIndicator({
    super.key,
    Color? colorIndicator,
  }) {
    _color = colorIndicator ?? AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(color:_color),
      ),
    );
  }
}
