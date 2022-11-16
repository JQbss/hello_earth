part of 'mission_questionnaire_bloc.dart';

abstract class MissionQuestionnaireEvent extends Equatable {
  const MissionQuestionnaireEvent();

  @override
  List<dynamic> get props => [];
}

class MissionQuestionnaireFetchData extends MissionQuestionnaireEvent {
  const MissionQuestionnaireFetchData();
}

class MissionQuestionnaireFinishRequested extends MissionQuestionnaireEvent {
  const MissionQuestionnaireFinishRequested();
}
