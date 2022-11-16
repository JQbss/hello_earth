part of 'home_parent_bloc.dart';

class HomeParentState extends Equatable {
  final ParentModel? parentModel;
  final PlayerModel? playerModel;
  final MainMissionsModel? mainMissions;

  const HomeParentState({
    required this.parentModel,
    required this.playerModel,
    required this.mainMissions,
  });

  @override
  List<dynamic> get props => [
    parentModel,
    mainMissions,
  ];
}

class HomeParentInitial extends HomeParentState {
  const HomeParentInitial()
      : super(
    parentModel: null,
    playerModel: null,
    mainMissions: null,
  );
}

class HomeParentFetchLoading extends HomeParentState {
  const HomeParentFetchLoading()
      : super(
    parentModel: null,
    playerModel: null,
    mainMissions: null,
  );
}

class HomeParentFetchSuccess extends HomeParentState {
  const HomeParentFetchSuccess({
    required super.parentModel,
    required super.playerModel,
    required super.mainMissions,
  });
}

class HomeParentFetchFailed extends HomeParentState {
  const HomeParentFetchFailed()
      : super(
    parentModel: null,
    playerModel: null,
    mainMissions: null,
  );
}

class HomeParentQuestionnaireStarted extends HomeParentState {
  const HomeParentQuestionnaireStarted({
    required super.parentModel,
    required super.playerModel,
    required super.mainMissions,
  });
}
