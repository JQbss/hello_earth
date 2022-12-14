import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/constants.dart';
import 'package:hello_earth/generated/assets.gen.dart';
import 'package:hello_earth/modals/mission_description_dialog.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/player/home_player/home_player_bloc.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_arguments.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/routing/dashboard_tabs/player/home_player_routing.dart';
import 'package:hello_earth/routing/dashboard_tabs/shopping_lists_routing.dart';
import 'package:hello_earth/routing/routing.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/level_model.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';

class HomePlayerPage extends StatefulWidget {
  const HomePlayerPage({
    super.key,
  });

  @override
  State<HomePlayerPage> createState() => _HomePlayerPageState();
}

class _HomePlayerPageState extends BlocPageState<HomePlayerPage, HomePlayerBloc> {
  bool enabledLevel = true;

  @override
  void initState() {
    super.initState();
    bloc.add(
      HomePlayerRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (_, state) {
        if (state is ConfigurationInitial) {
          return AppProgressIndicator();
        } else if (state is ConfigurationCompleted) {
          return BlocBuilder<HomePlayerBloc, HomePlayerState>(
            builder: (_, __) {
              return _buildBody();
            },
          );
        } else {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            NavigationUtils.moveToConfigurationPlayer(context);
          });
          return SizedBox();
        }
      },
    );
  }

  Widget _buildBody() {
    final List<LevelModel?> levels = bloc.state.mainMissions?.levels ?? [];
    int levelNumber = 0;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimensions.padding.columnTop,
        ),
        child: Column(
          children: levels.map(
            (level) {
              enabledLevel = levelNumber <= (bloc.state.playerModel?.currentLevel ?? 0);
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
    if (mission == null) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.padding.missionBottom),
      child: Stack(
        children: [
          Container(
            height: AppDimensions.height.mission,
            decoration: BoxDecoration(
              color: _setMissionColor(mission.uid),
              shape: BoxShape.circle,
            ),
            child: AdaptiveButton(
              isActive: enabledLevel && !_isMissionCompleted(missionUid),
              height: AppDimensions.height.mission - 10.0,
              child: Container(
                height: AppDimensions.height.mission - 10.0,
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  shape: BoxShape.circle,
                ),
                child: Image.memory(
                  base64Decode(mission.icon ?? ''),
                ),
              ),
              onPressed: () {
                final ShoppingListDetailsArguments arguments = ShoppingListDetailsArguments(
                  ingredients: mission.ingredients,
                  isParentVisible: false,
                  missionName: mission.title,
                  uid: missionUid,
                );
                MissionDescriptionDialog.show(
                  context,
                  missionModel: mission,
                  missionShoppingListsCompleted: bloc.state.playerModel?.completedMissionShoppingLists ?? [],
                  onCookingMissionPressed: () => Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamedAndRemoveUntil(
                    ShoppingListsRouting.shoppingListDetails,
                    (route) => route.settings.name == Routing.dashboard,
                    arguments: arguments,
                  ),
                  onStartMissionPressed: () => {
                    _onStartMissionPressed(
                      mission: mission,
                    ),
                  },
                );
              },
            ),
          ),
          if (enabledLevel && !_isMissionCompleted(missionUid))
            const SizedBox.shrink()
          else if (_isMissionCompleted(missionUid))
            Positioned(
              bottom: 0,
              right: 10,
              child: Assets.svgIcons.crown.svg(),
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

  bool _isMissionCompleted(String missionId) {
    return bloc.state.playerModel?.completedMissions?.contains(missionId) ?? false;
  }

  Color _setMissionColor(String? missionId) {
    if (missionId == null || missionId.isEmpty) return AppColors.primary;
    if (!enabledLevel) {
      return AppColors.disabledMission;
    }
    if (_isMissionCompleted(missionId)) {
      return AppColors.completedMission;
    }
    if (missionId == bloc.state.playerModel?.currentMission?.missionUid) {
      return AppColors.currentMission;
    }
    return AppColors.primary;
  }

  void _onStartMissionPressed({
    required MissionModel mission,
  }) {
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushNamedAndRemoveUntil(
      HomePlayerRouting.mission,
      (route) => route.settings.name == Routing.dashboard,
      arguments: PlayerMissionArguments(
        mission: mission,
        playerModel: bloc.state.playerModel,
      ),
    );
  }
}
