part of 'achievements_bloc.dart';

abstract class AchievementsEvent extends Equatable {
  const AchievementsEvent();

  @override
  List<dynamic> get props => [];
}

class AchievementsRequested extends AchievementsEvent {
  const AchievementsRequested();
}
