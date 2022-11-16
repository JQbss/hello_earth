import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';
import 'package:hello_earth/repositories/main_missions/main_missions_repository.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';
import 'package:hello_earth/ui/models/main_missions_model.dart';
import 'package:hello_earth/ui/models/parent_model.dart';
import 'package:hello_earth/ui/models/player_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'home_parent_event.dart';

part 'home_parent_state.dart';

class HomeParentBloc extends Bloc<HomeParentEvent, HomeParentState> {
  final FamilyRepository familyRepository;
  final MainMissionsRepository mainMissionsRepository;
  final MissionRepository missionRepository;
  final UserModel? profile;
  late StreamSubscription _streamSubscription;

  HomeParentBloc({
    required this.familyRepository,
    required this.mainMissionsRepository,
    required this.missionRepository,
    required this.profile,
  }) : super(HomeParentInitial()) {
    on<HomeParentRequested>(_onHomeParentRequested);
    //_initStreamSubscriptions();
  }

  Future<void> _onHomeParentRequested(
    HomeParentRequested event,
    Emitter<HomeParentState> emit,
  ) async {
    try {
      emit(
        const HomeParentFetchLoading(),
      );
      final ParentModel parentModel =
          (await familyRepository.getParent(familyId: profile?.familyId ?? ''))
              .data
              .mapToParentModel();
      final PlayerModel playerModel =
          (await familyRepository.getPlayer(familyId: profile?.familyId ?? ''))
              .data
              .mapToPlayerModel();
      final MainMissionsModel? mainMissions =
          (await mainMissionsRepository.getMainMissions())
              .data
              .mapToMainMissionsModel();
      emit(
        HomeParentFetchSuccess(
          parentModel: parentModel,
          playerModel: playerModel,
          mainMissions: mainMissions,
        ),
      );
    } catch (error) {
      emit(
        const HomeParentFetchFailed(),
      );
    }
  }
}
