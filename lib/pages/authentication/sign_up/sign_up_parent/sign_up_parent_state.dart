part of 'sign_up_parent_bloc.dart';

abstract class SignUpParentState extends Equatable {
  const SignUpParentState();

  @override
  List<Object> get props => [];
}

class SignUpParentInitial extends SignUpParentState {
  const SignUpParentInitial();
}

class SignUpParentSuccess extends SignUpParentState{
  const SignUpParentSuccess();
}