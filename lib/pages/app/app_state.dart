part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<dynamic> get props => [];
}

class AppInitial extends AppState {
  const AppInitial();
}
