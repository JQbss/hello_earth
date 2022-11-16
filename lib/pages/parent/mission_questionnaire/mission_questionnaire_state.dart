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
  const MissionQuestionnaireLoading({
    required super.missionQuestionnaire,
  });
}

class MissionQuestionnaireFailed extends MissionQuestionnaireState {
  const MissionQuestionnaireFailed({
    required super.missionQuestionnaire,
  });
}

class MissionQuestionnaireSuccess extends MissionQuestionnaireState {
  MissionQuestionnaireSuccess({
    required super.missionQuestionnaire,
  });

  @override
  List<Object> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}
