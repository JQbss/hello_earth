import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/settings/settings_bloc.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/bezier_curve_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BlocPageState<SettingsPage, SettingsBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const BezierCurveTitle(title: 'Ustawienia'),
              _buildLogoutButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return AdaptiveButton(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimensions.radius.button),
      ),
      child: Text(
        'Wyloguj',
        style: TextStyle(
          color: AppColors.buttonText,
        ),
      ),
      onPressed: () {
        bloc.add(
          SettingLogoutRequested(),
        );
      },
    );
  }
}
