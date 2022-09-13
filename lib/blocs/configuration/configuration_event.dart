part of 'configuration_bloc.dart';

abstract class ConfigurationEvent extends Equatable {
  const ConfigurationEvent();

  @override
  List<dynamic> get props => [];
}

class ConfigurationCheckParentRequested extends ConfigurationEvent {
  final String parentUid;

  const ConfigurationCheckParentRequested({
    required this.parentUid,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        parentUid,
      ];
}
