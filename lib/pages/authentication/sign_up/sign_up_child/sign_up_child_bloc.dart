import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_child_event.dart';

part 'sign_up_child_state.dart';

class SignUpChildBloc extends Bloc<SignUpChildEvent, SignUpChildState> {
  SignUpChildBloc() : super(SignUpChildInitial()) {
    on<SignUpChildEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
