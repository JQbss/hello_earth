import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/repositories/main_missions/main_missions_repository.dart';
import 'package:hello_earth/ui/models/main_missions_model.dart';

part 'home_player_event.dart';

part 'home_player_state.dart';

class HomePlayerBloc extends Bloc<HomePlayerEvent, HomePlayerState> {
  final MainMissionsRepository mainMissionsRepository;

  HomePlayerBloc({
    required this.mainMissionsRepository,
  }) : super(HomePlayerInitial()) {
    on<HomePlayerRequested>(_onHomePlayerRequested);
  }

  Future<void> _onHomePlayerRequested(
    HomePlayerRequested event,
    Emitter<HomePlayerState> emit,
  ) async {
    try {
      emit(
        HomePlayerFetchLoading(),
      );
      final MainMissionsModel? mainMissions =
          (await mainMissionsRepository.getMainMissions()).data.mapToMainMissionsModel();
      emit(
        HomePlayerFetchSuccess(
          mainMissions: mainMissions,
        ),
      );
    } catch (error) {
      emit(
        HomePlayerFetchFailed(),
      );
    }
  }
}
