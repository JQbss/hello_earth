part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  final UserModel? profile;

  const UserDataState({
    required this.profile,
  });

  @override
  List<dynamic> get props => [
        profile,
      ];
}

class UserDataInitial extends UserDataState {
  const UserDataInitial({
    super.profile = null,
  });
}

class UserDataGetUserSuccess extends UserDataState {
  const UserDataGetUserSuccess({
    required super.profile,
  });
}

class UserDataGetUserFailure extends UserDataState {
  const UserDataGetUserFailure({
    super.profile = null,
  });
}
