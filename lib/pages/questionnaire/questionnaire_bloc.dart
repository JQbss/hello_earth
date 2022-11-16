import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/mappers/parent_mappers.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/parent.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/ui/models/mission_questionnaire_model.dart';
import 'package:hello_earth/ui/models/parent_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'questionnaire_event.dart';

part 'questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final FamilyRepository familyRepository;
  final UserModel? profile;

  late StreamSubscription _streamSubscription;

  QuestionnaireBloc({
    required this.familyRepository,
    required this.profile,
  }) : super(const QuestionnaireInitial()) {
    on<QuestionnaireFetchData>(_onQuestionnaireFetchData);
    on<QuestionnaireChangeRequested>(_onQuestionnaireChangeRequested);
    _initStreamSubscriptions();
  }

  void _initStreamSubscriptions() {
    final String? familyId = profile?.familyId;
    if (familyId == null) return;
    _streamSubscription = familyRepository.getParentSubscription(familyId: familyId).listen(
      (event) {
        final BaseResponse<Parent> responseParent = BaseResponse<Parent>.fromJson(
          jsonDecode(jsonEncode(event.snapshot.value)) as Map<String, dynamic>,
        );
        final ParentModel parent = responseParent.data.mapToParentModel();
        add(
          QuestionnaireChangeRequested(
            parentModel: parent,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  Future<void> _onQuestionnaireFetchData(
    QuestionnaireFetchData event,
    Emitter<QuestionnaireState> emit,
  ) async {
    emit(
      QuestionnaireLoading(
        missionQuestionnaires: state.missionQuestionnaires,
      ),
    );
    try {
      final ParentModel parentModel =
          (await familyRepository.getParent(familyId: profile?.familyId ?? '')).data.mapToParentModel();
      emit(
        QuestionnaireSuccess(
          missionQuestionnaires: parentModel.missionQuestionnaires,
        ),
      );
    } catch (error) {
      emit(
        QuestionnaireFailed(
          missionQuestionnaires: state.missionQuestionnaires,
        ),
      );
    }
  }

  Future<void> _onQuestionnaireChangeRequested(
    QuestionnaireChangeRequested event,
    Emitter<QuestionnaireState> emit,
  ) async {
    emit(
      QuestionnaireSuccess(
        missionQuestionnaires: event.parentModel.missionQuestionnaires,
      ),
    );
  }
}
