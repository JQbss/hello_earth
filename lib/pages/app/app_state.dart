part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<dynamic> get props => [];
}

class AppInitial extends AppState {
  const AppInitial();
}

class ThemeChanged extends AppState {
  final AppColors colors;
  final String test;

  const ThemeChanged({
    required this.colors,
    required this.test,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        colors,
        UniquePropProvider.get(),
      ];
}
