import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/parent/homeParent/home_parent_bloc.dart';
import 'package:hello_earth/utils/navigation_utils.dart';

class HomeParentPage extends StatefulWidget {
  const HomeParentPage({
    super.key,
  });

  @override
  State<HomeParentPage> createState() => _HomeParentPageState();
}

class _HomeParentPageState extends BlocPageState<HomeParentPage, HomeParentBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (context, state) {
        if(state is ConfigurationInitial) {
          return CircularProgressIndicator();
        } else if (state is ConfigurationCompleted) {
          return BlocBuilder<HomeParentBloc, HomeParentState>(
            builder: (context, state) {
              return Scaffold(
                body: _buildBody(),
              );
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

  Widget _buildBody() {
    return Container(
      child: Text(
        'Rodzic',
      ),
    );
  }
}
