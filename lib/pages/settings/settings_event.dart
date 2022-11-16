part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<dynamic> get props => [];
}

class SettingLogoutRequested extends SettingsEvent{
  const SettingLogoutRequested();
}
