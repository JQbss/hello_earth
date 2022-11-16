import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_bloc.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';

class PlayerMissionPage extends StatefulWidget {
  const PlayerMissionPage();

  @override
  State<PlayerMissionPage> createState() => _PlayerMissionPageState();
}

class _PlayerMissionPageState extends BlocPageState<PlayerMissionPage, PlayerMissionBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      const PlayerMissionFetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMissionBloc, PlayerMissionState>(
      builder: (_, state) {
        Widget child;
        if (state is PlayerMissionInitial) {
          child = AppProgressIndicator();
        } else if (state is PlayerMissionSuccess) {
          child = _buildBody();
        } else {
          child = const SizedBox.shrink();
        }
        return SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 250,
            ),
            child: Scaffold(
              backgroundColor: AppColors.appBackground,
              body: child,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return Text('jupi');
  }
}
