part of 'questionnaire_bloc.dart';

abstract class QuestionnaireState extends Equatable {
  final Map<String, MissionQuestionnaireModel?>? missionQuestionnaires;

  const QuestionnaireState({
    required this.missionQuestionnaires,
  });

  @override
  List<dynamic> get props => [
        missionQuestionnaires,
      ];
}

class QuestionnaireInitial extends QuestionnaireState {
  const QuestionnaireInitial()
      : super(
          missionQuestionnaires: null,
        );
}

class QuestionnaireLoading extends QuestionnaireState {
  const QuestionnaireLoading({
    required super.missionQuestionnaires,
  });
}

class QuestionnaireSuccess extends QuestionnaireState {
  QuestionnaireSuccess({
    required super.missionQuestionnaires,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}

class QuestionnaireFailed extends QuestionnaireState {
  const QuestionnaireFailed({
    required super.missionQuestionnaires,
  });
}
