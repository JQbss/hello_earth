import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_parent_event.dart';

part 'sign_up_parent_state.dart';

class SignUpParentBloc extends Bloc<SignUpParentEvent, SignUpParentState> {
  SignUpParentBloc() : super(SignUpParentInitial()) {
    on<SignUpParentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
