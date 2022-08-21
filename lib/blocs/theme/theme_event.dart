part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<dynamic> get props => [];
}

class ChangeThemeRequested extends ThemeEvent {
  final AppColorsTheme colors;
  final String themeName;

  const ChangeThemeRequested({
    required this.colors,
    required this.themeName,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        colors,
      ];
}
