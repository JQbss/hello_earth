import 'package:flutter/material.dart';
import 'package:hello_earth/generated/assets.gen.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/task_type_model.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class MissionDescriptionDialog {
  const MissionDescriptionDialog._();

  static Future<void> show(
    BuildContext context, {
    required MissionModel? missionModel,
    required VoidCallback onCookingMissionPressed,
    required VoidCallback onStartMissionPressed,
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: _buildContent(
          context,
          missionModel: missionModel,
        ),
        actions: [
          if (missionModel?.taskType == TaskTypeModel.cooking)
            _buildButton(
              context,
              buttonTitle: 'Sprawdź potrzebne składniki',
              onStartMissionPressed: onCookingMissionPressed,
            )
          else
            _buildButton(
              context,
              buttonTitle: 'Rozpocznij zadanie',
              onStartMissionPressed: onStartMissionPressed,
            ),
        ],
      ),
    );
  }

  static Widget _buildContent(
    BuildContext context, {
    required MissionModel? missionModel,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(
          context,
          missionModel: missionModel,
        ),
        _buildDescription(missionModel),
      ],
    );
  }

  static Widget _buildHeader(
    BuildContext context, {
    required MissionModel? missionModel,
  }) {
    return Stack(
      children: [
        _buildIcon(context),
        _buildTitle(missionModel),
        _buildCloseButton(context),
      ],
    );
  }

  static Widget _buildIcon(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.pngIcons.eggs.path),
        ),
      ),
    );
  }

  static Widget _buildTitle(MissionModel? missionModel) {
    if (missionModel?.title == null) return const SizedBox.shrink();
    return Positioned(
      bottom: 15.0,
      left: 20.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.textFieldBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radius.input),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.padding.text),
          child: Text(
            missionModel?.title ?? '',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: AdaptiveButton(
        child: Icon(
          Icons.close,
          color: AppColors.primary,
        ),
        onPressed: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pop(),
      ),
    );
  }

  static Widget _buildDescription(MissionModel? missionModel) {
    if (missionModel?.longDescription == null) return const SizedBox.shrink();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding.text,
          vertical: AppDimensions.defaultPadding,
        ),
        child: Text(missionModel?.longDescription ?? ''),
      ),
    );
  }

  static Widget _buildButton(
    BuildContext context, {
    required VoidCallback onStartMissionPressed,
    required String buttonTitle,
  }) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimensions.radius.button),
        ),
        child: AdaptiveButton(
          onPressed: onStartMissionPressed,
          child: Text(
            buttonTitle,
            style: TextStyle(color: AppColors.buttonText),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
