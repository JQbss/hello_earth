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

class MissionQuestionnaireRatingChangeRequested
    extends MissionQuestionnaireEvent {
  final int newRating;

  const MissionQuestionnaireRatingChangeRequested({
    required this.newRating,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        newRating,
      ];
}
