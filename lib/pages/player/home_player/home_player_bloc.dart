import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/networking/requests/current_mission_request.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/repositories/main_missions/main_missions_repository.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';
import 'package:hello_earth/ui/models/current_mission_model.dart';
import 'package:hello_earth/ui/models/main_missions_model.dart';
import 'package:hello_earth/ui/models/player_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'home_player_event.dart';

part 'home_player_state.dart';

class HomePlayerBloc extends Bloc<HomePlayerEvent, HomePlayerState> {
  final FamilyRepository familyRepository;
  final MainMissionsRepository mainMissionsRepository;
  final MissionRepository missionRepository;
  final UserModel? profile;
  late StreamSubscription _streamSubscription;

  HomePlayerBloc({
    required this.familyRepository,
    required this.mainMissionsRepository,
    required this.missionRepository,
    required this.profile,
  }) : super(HomePlayerInitial()) {
    on<HomePlayerRequested>(_onHomePlayerRequested);
    on<HomePlayerMissionStartRequested>(_onHomePlayerMissionStartRequested);
    on<HomePlayerChangeRequest>(_onHomePlayerChangeRequest);
    _initStreamSubscriptions();
  }

  void _initStreamSubscriptions() {
    final String? familyId = profile?.familyId;
    if (familyId == null) return;
    _streamSubscription = familyRepository.getPlayerSubscription(familyId: familyId).listen((event) {
      final BaseResponse<Player> responsePlayer = BaseResponse<Player>.fromJson(
        jsonDecode(jsonEncode(event.snapshot.value)) as Map<String, dynamic>,
      );
      final PlayerModel playerModel = responsePlayer.data.mapToPlayerModel();
      add(
        HomePlayerChangeRequest(
          playerModel: playerModel,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  Future<void> _onHomePlayerRequested(
    HomePlayerRequested event,
    Emitter<HomePlayerState> emit,
  ) async {
    try {
      emit(
        const HomePlayerFetchLoading(),
      );
      final PlayerModel playerModel =
          (await familyRepository.getPlayer(familyId: profile?.familyId ?? '')).data.mapToPlayerModel();
      final MainMissionsModel? mainMissions =
          (await mainMissionsRepository.getMainMissions()).data.mapToMainMissionsModel();
      emit(
        HomePlayerFetchSuccess(
          playerModel: playerModel,
          mainMissions: mainMissions,
        ),
      );
    } catch (error) {
      emit(
        const HomePlayerFetchFailed(),
      );
    }
  }

  Future<void> _onHomePlayerMissionStartRequested(
    HomePlayerMissionStartRequested event,
    Emitter<HomePlayerState> emit,
  ) async {
    try {
      final CurrentMissionRequest currentMissionRequest = CurrentMissionRequest(
        currentStep: 0,
        missionUid: event.missionUid,
      );
      missionRepository.startMission(
        familyUid: event.familyUid,
        missionRequest: currentMissionRequest,
      );
      final CurrentMissionModel currentMissionModel = CurrentMissionModel(
        currentStep: 0,
        missionUid: event.missionUid,
      );
      emit(
        HomePlayerMissionStarted(
          playerModel: state.playerModel,
          mainMissions: state.mainMissions,
        ),
      );
    } catch (error) {
      emit(
        const HomePlayerFetchFailed(),
      );
    }
  }

  Future<void> _onHomePlayerChangeRequest(
    HomePlayerChangeRequest event,
    Emitter<HomePlayerState> emit,
  ) async {
    emit(
      HomePlayerFetchSuccess(
        playerModel: event.playerModel,
        mainMissions: state.mainMissions,
      ),
    );
  }
}
