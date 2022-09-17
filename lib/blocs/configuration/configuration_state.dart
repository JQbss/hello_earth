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

class ConfigurationUserCreateNeeded extends ConfigurationState {
  const ConfigurationUserCreateNeeded();
}

class ConfigurationCompleted extends ConfigurationState {
  const ConfigurationCompleted();
}

class QuestionnaireCompleteNeeded extends ConfigurationState {
  const QuestionnaireCompleteNeeded();
}
