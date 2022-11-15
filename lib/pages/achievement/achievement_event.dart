part of 'achievement_bloc.dart';

abstract class AchievementEvent extends Equatable {
  const AchievementEvent();

  @override
  List<dynamic> get props => [];
}

class AchievementRequested extends AchievementEvent {
  const AchievementRequested();
}
