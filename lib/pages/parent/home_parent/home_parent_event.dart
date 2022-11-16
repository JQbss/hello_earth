part of 'home_parent_bloc.dart';

abstract class HomeParentEvent extends Equatable {
  const HomeParentEvent();
  @override
  List<dynamic> get props => [];
}

class HomeParentQuestionnaireRequested extends HomeParentEvent {
  final String familyUid;
  final String missionUid;

  const HomeParentQuestionnaireRequested({
    required this.familyUid,
    required this.missionUid,
  });

  @override
  List<dynamic> get props => [
    ...super.props,
    familyUid,
    missionUid,
  ];
}

class HomeParentRequested extends HomeParentEvent {
  const HomeParentRequested();
}

class HomeParentChangeRequest extends HomeParentEvent {
  final ParentModel parentModel;

  const HomeParentChangeRequest({
    required this.parentModel,
  });

  @override
  List<dynamic> get props => [
    ...super.props,
    parentModel,
  ];
}
