part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<dynamic> get props => [];
}

class ChangeThemeRequestedAppEvent extends AppEvent {
  final AppColors colors;
  final String test;

  const ChangeThemeRequestedAppEvent({
    required this.colors,
    required this.test,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        colors,
        UniquePropProvider.get(),
      ];
}
