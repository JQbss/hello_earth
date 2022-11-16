import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/questionnaire/questionnaire_bloc.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({
    super.key,
  });

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends BlocPageState<QuestionnairePage, QuestionnaireBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (_, state) {
        if (state is ConfigurationInitial) {
          return AppProgressIndicator();
        } else if (state is ConfigurationCompleted) {
          return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
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
    return Text('Questionnaire');
  }
}