import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/achievement/achievement_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage();

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState
    extends BlocPageState<AchievementPage, AchievementBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      AchievementRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementBloc, AchievementState>(
      builder: (_, state) {
        Widget child;
        if (state is AchievementInitial) {
          child = Transform.scale(
            scale: 0.4,
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is AchievementCompleted) {
          child = SizedBox();
        } else {
          child = SizedBox();
        }
        return child;
      },
    );
  }
}
