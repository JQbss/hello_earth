import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_earth/repositories/family/family_repository.dart';

part 'configuration_event.dart';

part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final FamilyRepository familyRepository;

  ConfigurationBloc({
    required this.familyRepository,
  }) : super(ConfigurationInitial()) {
    on<ConfigurationCheckParentRequested>(_onConfigurationCheckParentRequested);
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
    emit(
      ConfigurationCompleted(),
    );
  }
}
