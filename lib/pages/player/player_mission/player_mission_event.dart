part of 'player_mission_bloc.dart';

abstract class PlayerMissionEvent extends Equatable {
  const PlayerMissionEvent();

  @override
  List<dynamic> get props => [];
}

class PlayerMissionFetchData extends PlayerMissionEvent {
  const PlayerMissionFetchData();
}

class PlayerMissionChangeRequested extends PlayerMissionEvent {
  final int currentStep;

  const PlayerMissionChangeRequested({
    required this.currentStep,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        currentStep,
      ];
}

class PlayerMissionFinishRequested extends PlayerMissionEvent {
  const PlayerMissionFinishRequested();
}
