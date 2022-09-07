part of 'home_player_bloc.dart';

abstract class HomePlayerState extends Equatable {
  const HomePlayerState();
}

class HomePlayerInitial extends HomePlayerState {
  @override
  List<Object> get props => [];
}
