import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/constants.dart';
import 'package:hello_earth/generated/assets.gen.dart';
import 'package:hello_earth/modals/mission_description_dialog.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/player/home_player/home_player_bloc.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/routing/dashboard_tabs/shopping_lists_routing.dart';
import 'package:hello_earth/ui/models/level_model.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class HomePlayerPage extends StatefulWidget {
  const HomePlayerPage({
    super.key,
  });

  @override
  State<HomePlayerPage> createState() => _HomePlayerPageState();
}

class _HomePlayerPageState
    extends BlocPageState<HomePlayerPage, HomePlayerBloc> {
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
          return Center(
            child: CircularProgressIndicator(),
          );
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
          missions: mapka,
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
        if (missionsIcons.length <
                Constants.missions.numberInRow[
                    currentRow % Constants.missions.numberInRow.length] &&
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
      child: Container(
        height: AppDimensions.height.mission,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: AdaptiveButton(
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
          onPressed: () => {
            MissionDescriptionDialog.show(
              context,
              missionModel: mission,
              onStartMissionPressed: () => {
                _onStartMissionPressed(
                  missionUid: missionUid,
                ),
              },
            )
          },
        ),
    return Container(
      child: AdaptiveButton(
        child: Text(
          mission?.title ?? '',
        ),
        onPressed: () => {
          MissionDescriptionDialog.show(
            context,
            missionModel: mission,
            onCookingMissionPressed: ()=>Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed(
              ShoppingListsRouting.shoppingListDetails,
            ),
            onStartMissionPressed: () => {
              _onStartMissionPressed(
                missionUid: missionUid,
              ),
            },
          )
        },
      ),
    );
  }

  void _onStartMissionPressed({
    required String missionUid,
  }) {
    UserDataBloc userBloc = BlocProvider.of<UserDataBloc>(context);
    bloc.add(
      HomePlayerMissionStartRequested(
        familyUid: userBloc.state.profile?.familyId ?? '',
        missionUid: missionUid,
      ),
    );
    Navigator.of(
      context,
      rootNavigator: true,
    ).pop();
  }
}
