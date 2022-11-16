import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/errors/error_keys.dart';
import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/networking/requests/completed_mission_questionnaires_request.dart';
import 'package:hello_earth/networking/requests/mission_questionnaire_request.dart';
import 'package:hello_earth/networking/requests/mission_questionnaires_request.dart';
import 'package:hello_earth/pages/parent/mission_questionnaire/mission_questionnaire_arguments.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/mission_questionnaire_model.dart';
import 'package:hello_earth/ui/models/parent_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';
import 'package:hello_earth/utils/text_field_validators_util.dart';

part 'mission_questionnaire_event.dart';

part 'mission_questionnaire_state.dart';

class MissionQuestionnaireBloc extends Bloc<MissionQuestionnaireEvent, MissionQuestionnaireState> {
  final MissionQuestionnaireArguments? arguments;
  final MissionRepository missionRepository;
  final UserModel? profile;
  late final ParentModel? parent;

  final TextFieldData questionnaireDescriptionTextField = TextFieldData(
    (text) => TextFieldValidatorsUtil.validateLogin(text.trim()),
    errorKey: ErrorKeys.login,
  );
  final List<int> list = <int>[1, 2, 3, 4, 5];
  late int dropdownValue = list.first;

  MissionQuestionnaireBloc({
    required this.arguments,
    required this.missionRepository,
    required this.profile,
  }) : super(const MissionQuestionnaireInitial()) {
    on<MissionQuestionnaireFetchData>(_onMissionQuestionnaireFetchData);
    on<MissionQuestionnaireFinishRequested>(_onMissionQuestionnaireFinishRequested);
    on<MissionQuestionnaireRatingChangeRequested>(_onMissionQuestionnaireRatingChangeRequested);
  }

  Future<void> _onMissionQuestionnaireFetchData(
    MissionQuestionnaireFetchData event,
    Emitter<MissionQuestionnaireState> emit,
  ) async {
    parent = arguments?.parent;
    final ParentModel? parentModel = parent;
    final MissionModel? mission = arguments?.mission;
    if (parentModel == null || parent == null || mission == null) return;
    final Map<String, MissionQuestionnaireModel?>? questionnaires = parent?.missionQuestionnaires;
    emit(
      MissionQuestionnaireLoading(
        missionQuestionnaire: state.missionQuestionnaire,
      ),
    );
    try {
      MissionQuestionnaireModel? questionnaire;
      if (questionnaires?.containsKey(mission.uid) ?? false) {
        questionnaire = questionnaires?[mission.uid];
        dropdownValue = questionnaire?.missionRating ?? 1;
        questionnaireDescriptionTextField.controller.text = questionnaire?.questionnaireDescription ?? '';
      } else {
        final MissionQuestionnairesRequest missionQuestionnairesRequest = MissionQuestionnairesRequest(
          missionQuestionnaires: parentModel.missionQuestionnaires.mapToMissionQuestionnaireRequest(),
        );
        final MissionQuestionnaireModel newQuestionnaire = MissionQuestionnaireModel(
          isCompleted: false,
          missionId: mission.uid,
          missionName: mission.title,
        );
        questionnaire = newQuestionnaire;
        final MissionQuestionnaireRequest questionnaireRequest = newQuestionnaire.mapToMissionQuestionnaireRequest();
        missionQuestionnairesRequest.missionQuestionnaires[mission.uid ?? ''] = questionnaireRequest;
        await missionRepository.startQuestionnaires(
          familyUid: profile?.familyId ?? '',
          missionQuestionnaires: missionQuestionnairesRequest,
        );
        MissionQuestionnaireSuccess(
          missionQuestionnaire: questionnaires?[mission.uid],
        );
      }
      emit(
        MissionQuestionnaireSuccess(
          missionQuestionnaire: questionnaire,
        ),
      );
    } catch (error) {
      emit(
        MissionQuestionnaireFailed(
          missionQuestionnaire: state.missionQuestionnaire,
        ),
      );
    }
  }

  Future<void> _onMissionQuestionnaireFinishRequested(
    MissionQuestionnaireFinishRequested event,
    Emitter<MissionQuestionnaireState> emit,
  ) async {
    final ParentModel? parentModel = parent;
    final MissionModel? mission = arguments?.mission;
    if (parentModel == null || mission == null) return;
    emit(
      MissionQuestionnaireLoading(
        missionQuestionnaire: state.missionQuestionnaire,
      ),
    );
    try {
      final MissionQuestionnairesRequest missionQuestionnairesRequest = MissionQuestionnairesRequest(
        missionQuestionnaires: parentModel.missionQuestionnaires.mapToMissionQuestionnaireRequest(),
      );
      final MissionQuestionnaireModel newQuestionnaire = MissionQuestionnaireModel(
        isCompleted: true,
        missionId: mission.uid,
        missionName: mission.title,
        missionRating: dropdownValue,
        questionnaireDescription: questionnaireDescriptionTextField.text,
      );
      final MissionQuestionnaireRequest questionnaireRequest = newQuestionnaire.mapToMissionQuestionnaireRequest();
      missionQuestionnairesRequest.missionQuestionnaires[mission.uid ?? ''] = questionnaireRequest;
      await missionRepository.startQuestionnaires(
        familyUid: profile?.familyId ?? '',
        missionQuestionnaires: missionQuestionnairesRequest,
      );
      final CompletedMissionQuestionnairesRequest completedMissionQuestionnairesRequest =
          CompletedMissionQuestionnairesRequest(
        completedQuestionnaire: parentModel.completedQuestionnaire ?? [],
      );
      completedMissionQuestionnairesRequest.completedQuestionnaire.add(mission.uid ?? '');
      await missionRepository.updateCompletedQuestionnaires(
        familyUid: profile?.familyId ?? '',
        completedMissionQuestionnairesRequest: completedMissionQuestionnairesRequest,
      );
      emit(
        MissionQuestionnaireSaveSuccess(
          missionQuestionnaire: state.missionQuestionnaire,
        ),
      );
    } catch (error) {
      emit(
        MissionQuestionnaireFailed(
          missionQuestionnaire: state.missionQuestionnaire,
        ),
      );
    }
  }

  Future<void> _onMissionQuestionnaireRatingChangeRequested(
    MissionQuestionnaireRatingChangeRequested event,
    Emitter<MissionQuestionnaireState> emit,
  ) async {
    dropdownValue = event.newRating;
    emit(
      MissionQuestionnaireSuccess(
        missionQuestionnaire: state.missionQuestionnaire,
      ),
    );
  }
}
