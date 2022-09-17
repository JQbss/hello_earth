part of 'configuration_bloc.dart';

abstract class ConfigurationState extends Equatable {
  const ConfigurationState();

  @override
  List<dynamic> get props => [];
}

class ConfigurationInitial extends ConfigurationState {
  const ConfigurationInitial();
}

class ConfigurationFamilyCreateNeeded extends ConfigurationState {
  const ConfigurationFamilyCreateNeeded();
}

class ConfigurationPlayerCreateNeeded extends ConfigurationState {
  const ConfigurationPlayerCreateNeeded();
}

class ConfigurationCompleted extends ConfigurationState {
  const ConfigurationCompleted();
}

class QuestionnaireCompleteNeeded extends ConfigurationState {
  const QuestionnaireCompleteNeeded();
}
