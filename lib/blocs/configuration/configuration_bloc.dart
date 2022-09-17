import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/networking/requests/family_request.dart';
import 'package:hello_earth/networking/requests/parent_request.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'configuration_event.dart';

part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final FamilyRepository familyRepository;

  ConfigurationBloc({
    required this.familyRepository,
  }) : super(ConfigurationInitial()) {
    on<CheckUserRegisterCompletedRequested>(_onCheckUserRegisterCompletedRequested);
    on<ConfigurationCheckParentRequested>(_onConfigurationCheckParentRequested);
    on<ConfigurationCreateFamilyRequested>(_onConfigurationCreateFamilyRequested);
  }

  Future<void> _onConfigurationCheckParentRequested(
    ConfigurationCheckParentRequested event,
    Emitter<ConfigurationState> emit,
  ) async {
    final bool isFamilyExists = await familyRepository.isFamilyExists(
      uid: event.parentUid,
    );
    if (!isFamilyExists) {
      emit(
        ConfigurationFamilyCreateNeeded(),
      );
      return;
    }
    final bool isPlayerExists = await familyRepository.isUserExists(
      uid: event.parentUid,
    );
    if (!isPlayerExists) {
      emit(
        ConfigurationUserCreateNeeded(),
      );
      return;
    }
    emit(
      ConfigurationCompleted(),
    );
  }

  Future<void> _onConfigurationCreateFamilyRequested(
    ConfigurationCreateFamilyRequested event,
    Emitter<ConfigurationState> emit,
  ) async {
    try {
      final UserModel? parent = event.parent;
      if (parent == null) return;
      final String? parentUid = parent.uid;
      if (parentUid == null) return;
      final ParentRequest parentRequest = ParentRequest(
        uid: parentUid,
      );
      final FamilyRequest family = FamilyRequest(
        parent: parentRequest,
      );
      await familyRepository.createFamily(
        family: family,
        uid: parentUid,
      );
      emit(
        ConfigurationUserCreateNeeded(),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> _onCheckUserRegisterCompletedRequested(
    CheckUserRegisterCompletedRequested event,
    Emitter<ConfigurationState> emit,
  ) async {
    emit(ConfigurationInitial());
    final bool isPlayerExists = await familyRepository.isUserExists(
      uid: event.parentUid ?? '',
    );
    if (!isPlayerExists) {
      emit(
        ConfigurationUserCreateNeeded(),
      );
    } else {
      emit(
        QuestionnaireCompleteNeeded(),
      );
    }
  }
}
