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

class ConfigurationCreateFamilyRequested extends ConfigurationEvent {
  final UserModel? parent;

  const ConfigurationCreateFamilyRequested({
    required this.parent,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        parent,
      ];
}

class CheckUserRegisterCompletedRequested extends ConfigurationEvent {
  final String? parentUid;

  const CheckUserRegisterCompletedRequested({
    required this.parentUid,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        parentUid,
      ];
}

class SaveQuestionnaireRequested extends ConfigurationEvent {
  final String? familyUid;
  final List<Contraindication> listOfContraindications;

  const SaveQuestionnaireRequested({
    required this.familyUid,
    required this.listOfContraindications,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        familyUid,
        listOfContraindications,
      ];
}
