part of 'home_player_bloc.dart';

abstract class HomePlayerEvent extends Equatable {
  const HomePlayerEvent();

  @override
  List<dynamic> get props => [];
}

class HomePlayerRequested extends HomePlayerEvent {
  const HomePlayerRequested();
}
