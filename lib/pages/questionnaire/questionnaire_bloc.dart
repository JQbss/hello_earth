import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'questionnaire_event.dart';
part 'questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  QuestionnaireBloc() : super(QuestionnaireInitial()) {
    on<QuestionnaireEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
