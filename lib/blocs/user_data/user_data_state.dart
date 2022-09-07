part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {
  const UserDataInitial();
}

class UserDataGetUserSuccess extends UserDataState {
  final UserModel user;

  const UserDataGetUserSuccess({
    required this.user,
  });
}

class UserDataGetUserFailure extends UserDataState {
  const UserDataGetUserFailure();
}
