import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/questionnaire/questionnaire_bloc.dart';
import 'package:hello_earth/ui/models/mission_questionnaire_model.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';
import 'package:hello_earth/widgets/bezier_curve_title.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({
    super.key,
  });

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends BlocPageState<QuestionnairePage, QuestionnaireBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      const QuestionnaireFetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      builder: (_, state) {
        if (state is QuestionnaireLoading) {
          return AppProgressIndicator();
        } else if (state is QuestionnaireSuccess) {
          return _buildBody();
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
           const BezierCurveTitle(title: 'Kwestionariusze'),
          _buildListOfQuestionnary(),
        ],
      ),
    );
  }

  Widget _buildListOfQuestionnary() {
    Map<String, MissionQuestionnaireModel?>? missionQuestionnaires = bloc.state.missionQuestionnaires;
    if(missionQuestionnaires == null) return SizedBox.shrink();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: missionQuestionnaires.length,
      itemBuilder: (BuildContext context, int index) {
        String key = missionQuestionnaires.keys.elementAt(index) ?? '';
        return Column(
          children: [
            ListTile(
              title: new Text("${missionQuestionnaires[key]?.missionName}"),
              subtitle: new Text("${missionQuestionnaires[key]?.questionnaireDescription ?? ''}"),
            ),
            Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
