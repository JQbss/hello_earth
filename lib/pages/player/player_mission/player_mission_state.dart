part of 'player_mission_bloc.dart';

abstract class PlayerMissionState extends Equatable {
  final MissionModel? mission;

  const PlayerMissionState({
    required this.mission,
  });

  @override
  List<dynamic> get props => [
        mission,
      ];
}

class PlayerMissionInitial extends PlayerMissionState {
  const PlayerMissionInitial()
      : super(
          mission: null,
        );
}

class PlayerMissionFailed extends PlayerMissionState {
  const PlayerMissionFailed()
      : super(
          mission: null,
        );
}

class PlayerMissionSuccess extends PlayerMissionState {
  PlayerMissionSuccess({
    required super.mission,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}

class PlayerMissionLoading extends PlayerMissionState {
  const PlayerMissionLoading({
    required super.mission,
  });
}

class PlayerMissionCompleted extends PlayerMissionState {
  const PlayerMissionCompleted({
    required super.mission,
  });
}
