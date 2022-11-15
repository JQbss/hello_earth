import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/bezier_curve_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const BezierCurveTitle(title: 'Ustawienia'),
    );
  }
}
