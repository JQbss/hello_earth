part of 'home_player_bloc.dart';

abstract class HomePlayerEvent extends Equatable {
  const HomePlayerEvent();

  @override
  List<dynamic> get props => [];
}

class HomePlayerMissionStartRequested extends HomePlayerEvent {
  final String familyUid;
  final String missionUid;

  const HomePlayerMissionStartRequested({
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

class HomePlayerRequested extends HomePlayerEvent {
  const HomePlayerRequested();
}
