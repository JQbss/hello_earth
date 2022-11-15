part of 'home_player_bloc.dart';

abstract class HomePlayerState extends Equatable {
  final int? currentLevel;
  final CurrentMissionModel? currentMission;
  final MainMissionsModel? mainMissions;

  const HomePlayerState({
    required this.currentLevel,
    required this.currentMission,
    required this.mainMissions,
  });

  @override
  List<dynamic> get props => [
        currentMission,
        mainMissions,
      ];
}

class HomePlayerInitial extends HomePlayerState {
  const HomePlayerInitial()
      : super(
          currentLevel: 0,
          currentMission: null,
          mainMissions: null,
        );
}

class HomePlayerFetchLoading extends HomePlayerState {
  const HomePlayerFetchLoading()
      : super(
          currentLevel: 0,
          currentMission: null,
          mainMissions: null,
        );
}

class HomePlayerFetchSuccess extends HomePlayerState {
  const HomePlayerFetchSuccess({
    required super.currentLevel,
    required super.currentMission,
    required super.mainMissions,
  });
}

class HomePlayerFetchFailed extends HomePlayerState {
  const HomePlayerFetchFailed()
      : super(
          currentLevel: 0,
          currentMission: null,
          mainMissions: null,
        );
}

class HomePlayerMissionStarted extends HomePlayerState {
  const HomePlayerMissionStarted({
    required super.currentLevel,
    required super.currentMission,
    required super.mainMissions,
  });
}
