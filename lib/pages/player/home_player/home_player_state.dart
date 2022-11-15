part of 'home_player_bloc.dart';

abstract class HomePlayerState extends Equatable {
  final PlayerModel? playerModel;
  final MainMissionsModel? mainMissions;

  const HomePlayerState({
    required this.playerModel,
    required this.mainMissions,
  });

  @override
  List<dynamic> get props => [
        playerModel,
        mainMissions,
      ];
}

class HomePlayerInitial extends HomePlayerState {
  const HomePlayerInitial()
      : super(
          playerModel: null,
          mainMissions: null,
        );
}

class HomePlayerFetchLoading extends HomePlayerState {
  const HomePlayerFetchLoading()
      : super(
          playerModel: null,
          mainMissions: null,
        );
}

class HomePlayerFetchSuccess extends HomePlayerState {
  const HomePlayerFetchSuccess({
    required super.playerModel,
    required super.mainMissions,
  });
}

class HomePlayerFetchFailed extends HomePlayerState {
  const HomePlayerFetchFailed()
      : super(
          playerModel: null,
          mainMissions: null,
        );
}

class HomePlayerMissionStarted extends HomePlayerState {
  const HomePlayerMissionStarted({
    required super.playerModel,
    required super.mainMissions,
  });
}
