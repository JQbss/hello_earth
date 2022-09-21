import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/mappers/contraindication_mappers.dart';
import 'package:hello_earth/mappers/player_mappers.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/contraindication.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/requests/family_request.dart';
import 'package:hello_earth/networking/requests/finish_questionnaire_request.dart';
import 'package:hello_earth/networking/requests/parent_request.dart';
import 'package:hello_earth/networking/requests/questionnaire_request.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/ui/models/player_model.dart';
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
    on<ConfigurationCheckPlayerRequested>(_onConfigurationCheckPlayerRequested);
    on<ConfigurationCreateFamilyRequested>(_onConfigurationCreateFamilyRequested);
    on<SaveQuestionnaireRequested>(_onSaveQuestionnaireRequested);
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
        ConfigurationPlayerCreateNeeded(),
      );
      return;
    }
    final BaseResponse<Player> player = await familyRepository.getPlayer(
      familyId: event.parentUid,
    );
    final PlayerModel playerModel = player.data.mapToPlayerModel();
    final bool? isQuestionnaireCompleted = playerModel.isQuestionnaireCompleted;
    if (isQuestionnaireCompleted == null || !isQuestionnaireCompleted) {
      emit(
        QuestionnaireCompleteNeeded(),
      );
      return;
    }
    emit(
      ConfigurationCompleted(),
    );
  }

  Future<void> _onConfigurationCheckPlayerRequested(
    ConfigurationCheckPlayerRequested event,
    Emitter<ConfigurationState> emit,
  ) async {
    final BaseResponse<Player> player = await familyRepository.getPlayer(
      familyId: event.familyId,
    );
    final PlayerModel playerModel = player.data.mapToPlayerModel();
    final bool? isQuestionnaireCompleted = playerModel.isQuestionnaireCompleted;
    if (isQuestionnaireCompleted == null || !isQuestionnaireCompleted) {
      emit(
        QuestionnaireCompleteNeeded(),
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
        ConfigurationPlayerCreateNeeded(),
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
        ConfigurationPlayerCreateNeeded(),
      );
    } else {
      emit(
        QuestionnaireCompleteNeeded(),
      );
    }
  }

  Future<void> _onSaveQuestionnaireRequested(
    SaveQuestionnaireRequested event,
    Emitter<ConfigurationState> emit,
  ) async {
    try {
      final String? familyUid = event.familyUid;
      if (familyUid == null) return;
      final QuestionnaireRequest questionnaire = QuestionnaireRequest(
        contraindications: event.listOfContraindications.mapToContraindicationRequests(),
      );
      final FinishQuestionnaireRequest questionnaireRequest = FinishQuestionnaireRequest(
        isQuestionnaireCompleted: true,
        questionnaire: questionnaire,
      );
      familyRepository.updateQuestionnaire(
        familyId: familyUid,
        questionnaireRequest: questionnaireRequest,
      );
      emit(
        ConfigurationCompleted(),
      );
    } catch (error) {
      print(error);
    }
  }
}
