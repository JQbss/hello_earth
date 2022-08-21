part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<dynamic> get props => [];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
}

class ThemeChanged extends ThemeState {
  final AppColorsTheme colors;
  final String themeName;

  const ThemeChanged({
    required this.colors,
    required this.themeName,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        colors,
      ];
}
