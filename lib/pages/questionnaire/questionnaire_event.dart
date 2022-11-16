part of 'questionnaire_bloc.dart';

abstract class QuestionnaireEvent extends Equatable {
  const QuestionnaireEvent();

  @override
  List<dynamic> get props => [];
}

class QuestionnaireFetchData extends QuestionnaireEvent {
  const QuestionnaireFetchData();
}

class QuestionnaireChangeRequested extends QuestionnaireEvent {
  final ParentModel parentModel;

  const QuestionnaireChangeRequested({
    required this.parentModel,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        parentModel,
      ];
}
