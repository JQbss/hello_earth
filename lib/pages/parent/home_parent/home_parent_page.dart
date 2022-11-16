import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/constants.dart';
import 'package:hello_earth/generated/assets.gen.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/parent/home_parent/home_parent_bloc.dart';

import 'package:hello_earth/styles/app_colors/app_colors.dart';import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/level_model.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';


class HomeParentPage extends StatefulWidget {
  const HomeParentPage({
    super.key,
  });

  @override
  State<HomeParentPage> createState() => _HomeParentPageState();
}

class _HomeParentPageState extends BlocPageState<HomeParentPage, HomeParentBloc> {

  @override
  void initState() {
    super.initState();
    bloc.add(
      HomeParentRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (context, state) {
        if(state is ConfigurationInitial) {
          return AppProgressIndicator();
        } else if (state is ConfigurationCompleted) {
          return BlocBuilder<HomeParentBloc, HomeParentState>(
            builder: (context, state) {
              return  _buildBody();
            },
          );
        } else {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            NavigationUtils.moveToConfigurationParent(context);
          });
          return SizedBox();
        }
      },
    );
  }

  // Widget _buildBody() {
  //   return  Text(
  //       'Rodzic'
  //     );
  // }

  Widget _buildBody() {
    final List<LevelModel?> levels = bloc.state.mainMissions?.levels ?? [];
    int levelNumber = 0;
    print(levels);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimensions.padding.columnTop,
        ),
        child: Column(
          children: levels.map(
                (level) {
              levelNumber++;
              return _buildLevelSection(
                levelNumber: levelNumber,
                levelModel: level,
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget _buildLevelSection({
    required int levelNumber,
    required LevelModel? levelModel,
  }) {
    final Map<String, MissionModel?> mapka = {
      'k1': levelModel?.missions?['qwertzzzzz'],
      'k2': levelModel?.missions?['qwertzzzzz'],
      'k3': levelModel?.missions?['qwertzzzzz'],
      'k4': levelModel?.missions?['qwertzzzzz'],
      'k5': levelModel?.missions?['qwertzzzzz'],
      'k6': levelModel?.missions?['qwertzzzzz'],
      'k7': levelModel?.missions?['qwertzzzzz'],
      'k8': levelModel?.missions?['qwertzzzzz'],
      'k9': levelModel?.missions?['qwertzzzzz'],
      'k10': levelModel?.missions?['qwertzzzzz'],
      'k11': levelModel?.missions?['qwertzzzzz'],
      'k12': levelModel?.missions?['qwertzzzzz'],
      'k13': levelModel?.missions?['qwertzzzzz'],
    };
    return Column(
      children: [
        _buildTitleLevelSection(
          levelNumber: levelNumber,
        ),
        _buildMissions(
          missions: levelModel?.missions,
        ),
      ],
    );
  }

  Widget _buildTitleLevelSection({
    required int levelNumber,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppDimensions.padding.missionBottom,
      ),
      child: Stack(
        children: [
          Assets.svgIcons.level.svg(
            width: AppDimensions.width.levelIcon,
          ),
          Positioned(
            bottom: AppDimensions.width.levelIcon / 5,
            left: AppDimensions.width.levelIcon / 2 - 8.0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.levelLogo,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  levelNumber.toString(),
                  style: TextStyle(
                    color: AppColors.levelLogoText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissions({
    required Map<String, MissionModel?>? missions,
  }) {
    final List<Row> missionsInRow = [];
    final List<Widget> missionsIcons = [];
    int currentRow = 0;
    int currentMission = 0;
    missions?.forEach(
          (key, mission) {
        currentMission++;
        missionsIcons.add(
          _buildMissionIcon(
            missionUid: key,
            mission: mission,
          ),
        );
        if (missionsIcons.length < Constants.missions.numberInRow[currentRow % Constants.missions.numberInRow.length] &&
            currentMission != missions.length) return;
        missionsInRow.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...missionsIcons,
            ],
          ),
        );
        missionsIcons.removeRange(0, missionsIcons.length);
        currentRow++;
      },
    );
    return Column(
      children: [
        ...missionsInRow,
      ],
    );
  }

  Widget _buildMissionIcon({
    required String missionUid,
    required MissionModel? mission,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.padding.missionBottom),
      child: Stack(
        children: [
          Container(
            height: AppDimensions.height.mission,
            decoration: BoxDecoration(
              color: _setMissionColor(mission?.uid),
              shape: BoxShape.circle,
            ),
            child: AdaptiveButton(
              isActive: _isQuestionnaireEnabled(missionUid) && !_isQuestionnaireCompleted(missionUid),
              height: AppDimensions.height.mission - 10.0,
              child: Container(
                height: AppDimensions.height.mission - 10.0,
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  shape: BoxShape.circle,
                ),
                child: Image.memory(
                  base64Decode(mission?.icon ?? ''),
                ),
              ),
              onPressed: () {},
            ),
          ),
          if (_isQuestionnaireEnabled(missionUid) && !_isQuestionnaireCompleted(missionUid))
            const SizedBox.shrink()
          else if (_isQuestionnaireCompleted(missionUid))
            Positioned(
              bottom: 0,
              right: 10,
              child:  Assets.svgIcons.crown.svg(),
            )
          else
            Positioned(
              bottom: 0,
              right: 10,
              child: Assets.svgIcons.padlock.svg(),
            ),
        ],
      ),
    );
  }

  bool _isQuestionnaireCompleted(String missionId) {
    return bloc.state.parentModel?.completedQuestionnaire?.contains(missionId) ?? false;
  }

  bool _isQuestionnaireEnabled(String missionId) {
    return bloc.state.playerModel?.completedMissions?.contains(missionId) ?? false;
  }

  Color _setMissionColor(String? missionId) {
    if (missionId == null || missionId.isEmpty) return AppColors.disabledMission;
    if (_isQuestionnaireCompleted(missionId)) {
      return AppColors.completedMission;
    }
    if (_isQuestionnaireEnabled(missionId)) {
      return AppColors.currentMission;
    }
    return AppColors.disabledMission;
  }

  void _onStartQuestionnairePressed({
    required String missionUid,
  }) {
    // UserDataBloc userBloc = BlocProvider.of<UserDataBloc>(context);
    // bloc.add(
    //   HomePlayerMissionStartRequested(
    //     familyUid: userBloc.state.profile?.familyId ?? '',
    //     missionUid: missionUid,
    //   ),
    // );
    // Navigator.of(
    //   context,
    //   rootNavigator: true,
    // ).pop();
  }
}
