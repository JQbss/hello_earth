import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/networking/requests/current_mission_request.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_arguments.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/player_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'player_mission_event.dart';

part 'player_mission_state.dart';

class PlayerMissionBloc extends Bloc<PlayerMissionEvent, PlayerMissionState> {
  final PlayerMissionArguments? arguments;
  final MissionRepository missionRepository;
  final UserModel? profile;
  late final PlayerModel? playerModel;

  PlayerMissionBloc({
    required this.arguments,
    required this.missionRepository,
    required this.profile,
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
      const PlayerMissionLoading(),
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
    try {
      playerModel?.currentMission?.currentStep = event.currentStep;
      final CurrentMissionRequest currentMissionRequest = CurrentMissionRequest(
        currentStep: event.currentStep,
      );
      missionRepository.startMission(
        familyUid: profile?.familyId ?? '',
        missionRequest: currentMissionRequest,
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
    try {} catch (error) {
      emit(
        const PlayerMissionFailed(),
      );
    }
  }
}
