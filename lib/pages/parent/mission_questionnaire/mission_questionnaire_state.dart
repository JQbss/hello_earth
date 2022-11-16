part of 'mission_questionnaire_bloc.dart';

abstract class MissionQuestionnaireState extends Equatable {
  final MissionQuestionnaireModel? missionQuestionnaire;

  const MissionQuestionnaireState({
    required this.missionQuestionnaire,
  });

  @override
  List<Object> get props => [];
}

class MissionQuestionnaireInitial extends MissionQuestionnaireState {
  const MissionQuestionnaireInitial()
      : super(
          missionQuestionnaire: null,
        );
}

class MissionQuestionnaireLoading extends MissionQuestionnaireState {
  const MissionQuestionnaireLoading()
      : super(
          missionQuestionnaire: null,
        );
}

class MissionQuestionnaireFailed extends MissionQuestionnaireState {
  const MissionQuestionnaireFailed()
      : super(
          missionQuestionnaire: null,
        );
}

class MissionQuestionnaireSuccess extends MissionQuestionnaireState {
  const MissionQuestionnaireSuccess({
    required super.missionQuestionnaire,
  });
}
