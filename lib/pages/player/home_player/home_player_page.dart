import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/pages/player/home_player/home_player_bloc.dart';
import 'package:hello_earth/utils/navigation_utils.dart';

class HomePlayerPage extends StatefulWidget {
  const HomePlayerPage({
    super.key,
  });

  @override
  State<HomePlayerPage> createState() => _HomePlayerPageState();
}

class _HomePlayerPageState extends State<HomePlayerPage> {
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
              return Scaffold(
                body: _buildBody(),
              );
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
    return Container(
      child: Text(
        'Gracz',
      ),
    );
  }
}
