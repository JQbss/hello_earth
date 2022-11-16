import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/parent/mission_questionnaire/mission_questionnaire_bloc.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';

class MissionQuestionnairePage extends StatefulWidget {
  const MissionQuestionnairePage();

  @override
  State<MissionQuestionnairePage> createState() => _MissionQuestionnairePageState();
}

class _MissionQuestionnairePageState extends BlocPageState<MissionQuestionnairePage, MissionQuestionnaireBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      const MissionQuestionnaireFetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissionQuestionnaireBloc, MissionQuestionnaireState>(
      builder: (_, state) {
        Widget child;
        if (state is MissionQuestionnaireLoading) {
          child = AppProgressIndicator();
        } else if (state is MissionQuestionnaireSuccess) {
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
