import 'package:flutter/material.dart';
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
        content: _buildContent(
          context,
          missionModel: missionModel,
        ),
        actions: [
          missionModel?.taskType == TaskTypeModel.cooking
              ? _buildButton(
                  context,
                  buttonTitle: 'Sprawdź potrzebne składniki',
                  onStartMissionPressed: onCookingMissionPressed,
                )
              : _buildButton(
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
    return Row(
      children: [
        _buildIcon(),
        _buildTitle(missionModel),
        _buildCloseButton(context),
      ],
    );
  }

  static Widget _buildIcon() {
    return Container();
  }

  static Widget _buildTitle(MissionModel? missionModel) {
    if (missionModel?.title == null) return SizedBox.shrink();
    return Text(missionModel?.title ?? '');
  }

  static Widget _buildCloseButton(BuildContext context) {
    return AdaptiveButton(
      child: Text('X'),
      onPressed: () => Navigator.of(
        context,
        rootNavigator: true,
      ).pop(),
    );
  }

  static Widget _buildDescription(MissionModel? missionModel) {
    if (missionModel?.longDescription == null) return SizedBox.shrink();
    return Text(missionModel?.longDescription ?? '');
  }

  static Widget _buildButton(
    BuildContext context, {
    required VoidCallback onStartMissionPressed,
    required String buttonTitle,
  }) {
    return AdaptiveButton(
      child: Text(buttonTitle),
      onPressed: onStartMissionPressed,
    );
  }
}
