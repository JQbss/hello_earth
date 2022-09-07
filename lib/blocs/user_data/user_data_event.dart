part of 'user_data_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<dynamic> get props => [];
}

class UserDataGetProfileRequested extends UserDataEvent {
  UserDataGetProfileRequested();

  @override
  List<dynamic> get props => [
        ...super.props,
        UniquePropProvider.get(),
      ];
}
