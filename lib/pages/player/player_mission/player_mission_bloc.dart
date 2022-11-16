import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/extensions/extensions.dart';
import 'package:hello_earth/networking/requests/completed_missions_request.dart';
import 'package:hello_earth/networking/requests/current_level_request.dart';
import 'package:hello_earth/networking/requests/current_mission_request.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_arguments.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';
import 'package:hello_earth/repositories/shopping_list/shopping_list_repository.dart';
import 'package:hello_earth/ui/models/current_mission_model.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/player_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'player_mission_event.dart';

part 'player_mission_state.dart';

class PlayerMissionBloc extends Bloc<PlayerMissionEvent, PlayerMissionState> {
  final PlayerMissionArguments? arguments;
  final MissionRepository missionRepository;
  final ShoppingListRepository shoppingListRepository;
  final UserModel? profile;
  late final PlayerModel? playerModel;

  PlayerMissionBloc({
    required this.arguments,
    required this.missionRepository,
    required this.profile,
    required this.shoppingListRepository,
  }) : super(const PlayerMissionInitial()) {
    on<PlayerMissionFetchData>(_onPlayerMissionFetchData);
    on<PlayerMissionChangeRequested>(_onPlayerMissionChangeRequested);
    on<PlayerMissionFinishRequested>(_onPlayerMissionFinishRequested);
  }

  Future<void> _onPlayerMissionFetchData(
    PlayerMissionFetchData event,
    Emitter<PlayerMissionState> emit,
  ) async {
    playerModel = arguments?.playerModel;
    if (playerModel == null) return;
    final MissionModel? mission = arguments?.mission;
    if (mission == null) return;
    emit(
      PlayerMissionLoading(
        mission: state.mission,
      ),
    );
    try {
      if (playerModel?.currentMission == null) {
        final CurrentMissionRequest currentMissionRequest = CurrentMissionRequest(
          currentStep: 0,
          missionUid: mission.uid ?? '',
        );
        missionRepository.startMission(
          familyUid: profile?.familyId ?? '',
          missionRequest: currentMissionRequest,
        );
        playerModel?.currentMission = CurrentMissionModel(
          currentStep: 0,
          missionUid: mission.uid ?? '',
        );
      }
      emit(
        PlayerMissionSuccess(
          mission: mission,
        ),
      );
    } catch (error) {
      emit(
        const PlayerMissionFailed(),
      );
    }
  }

  Future<void> _onPlayerMissionChangeRequested(
    PlayerMissionChangeRequested event,
    Emitter<PlayerMissionState> emit,
  ) async {
    final MissionModel? mission = arguments?.mission;
    if (mission == null) return;
    try {
      playerModel?.currentMission?.currentStep = event.currentStep;
      final CurrentMissionRequest currentMissionRequest = CurrentMissionRequest(
        currentStep: event.currentStep,
        missionUid: mission.uid ?? '',
      );
      missionRepository.startMission(
        familyUid: profile?.familyId ?? '',
        missionRequest: currentMissionRequest,
      );
      emit(
        PlayerMissionSuccess(
          mission: mission,
        ),
      );
    } catch (error) {
      emit(
        const PlayerMissionFailed(),
      );
    }
  }

  Future<void> _onPlayerMissionFinishRequested(
    PlayerMissionFinishRequested event,
    Emitter<PlayerMissionState> emit,
  ) async {
    emit(
      PlayerMissionLoading(
        mission: state.mission,
      ),
    );
    try {
      final CompletedMissionsRequest completedMissionsRequest = CompletedMissionsRequest(
        completedMissions: playerModel?.completedMissions.orEmpty() ?? [],
      );
      completedMissionsRequest.completedMissions.add(state.mission?.uid ?? '');
      await missionRepository.removeCurrentMission(
        familyUid: profile?.familyId ?? '',
      );
      await missionRepository.updateCompletedMissions(
        familyUid: profile?.familyId ?? '',
        completedMissionsRequest: completedMissionsRequest,
      );
      final CurrentLevelRequest currentLevelRequest =
          CurrentLevelRequest(currentLevel: (playerModel?.currentLevel ?? 0) + 1);
      await missionRepository.updateLevel(
        familyUid: profile?.familyId ?? '',
        currentLevelRequest: currentLevelRequest,
      );
      await shoppingListRepository.removeShoppingList(
        familyUid: profile?.familyId ?? '',
        missionUid: state.mission?.uid ?? '',
      );
      emit(
        PlayerMissionCompleted(
          mission: state.mission,
        ),
      );
    } catch (error) {
      emit(
        const PlayerMissionFailed(),
      );
    }
  }
}
