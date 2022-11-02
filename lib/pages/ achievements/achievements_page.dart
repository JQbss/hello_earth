import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/%20achievements/achievements_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage();

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState
    extends BlocPageState<AchievementsPage, AchievementsBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      AchievementsRequested(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsBloc, AchievementsState>(
      builder: (_, state) {
        Widget child;
        if (state is AchievementsInitial) {
          child = CircularProgressIndicator();
        } else {
          child = SizedBox();
        }
        return child;
      },
    );
  }
}
