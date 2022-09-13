import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/mappers/user_mappers.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/repositories/credential/credential_repository.dart';
import 'package:hello_earth/repositories/user/user_repository.dart';
import 'package:hello_earth/ui/models/user_model.dart';

part 'user_data_event.dart';

part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final CredentialRepository credentialRepository;
  final UserRepository userRepository;

  UserDataBloc({
    required this.credentialRepository,
    required this.userRepository,
  }) : super(UserDataInitial()) {
    on<UserDataGetProfileRequested>(_onUserDataGetProfileRequested);
  }

  Future<void> _onUserDataGetProfileRequested(
    UserDataGetProfileRequested event,
    Emitter<UserDataState> emit,
  ) async {
    User? user = await credentialRepository.currentFirebaseUser();
    if (user == null) {
      emit(
        UserDataGetUserFailure(),
      );
      return;
    }
    final BaseResponse<UserNetworking> userNetworking = await userRepository.me(
      userId: user.uid,
    );
    final UserModel userModel = userNetworking.data.mapToUserModel();
    try {
      emit(
        UserDataGetUserSuccess(
          profile: userModel,
        ),
      );
    } catch (error) {
      print(error);
      emit(
        UserDataGetUserFailure(),
      );
    }
  }
}
