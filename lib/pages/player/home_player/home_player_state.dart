part of 'home_player_bloc.dart';

abstract class HomePlayerState extends Equatable {
  final MainMissionsModel? mainMissions;

  const HomePlayerState({
    required this.mainMissions,
  });

  @override
  List<dynamic> get props => [];
}

class HomePlayerInitial extends HomePlayerState {
  const HomePlayerInitial()
      : super(
    mainMissions: null,
        );
}

class HomePlayerFetchLoading extends HomePlayerState {
  const HomePlayerFetchLoading()
      : super(
    mainMissions: null,
        );
}

class HomePlayerFetchSuccess extends HomePlayerState {
  const HomePlayerFetchSuccess({
    required super.mainMissions,
  });
}

class HomePlayerFetchFailed extends HomePlayerState {
  const HomePlayerFetchFailed()
      : super(
    mainMissions: null,
        );
}
