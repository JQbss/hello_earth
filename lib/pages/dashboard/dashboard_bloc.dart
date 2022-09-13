import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/pages/dashboard/commons/dashboard_tab.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final SessionBloc sessionBloc;

  DashboardBloc({
    required this.sessionBloc,
  }) : super(const DashboardInitial()) {
    on<ChangeTabRequested>(_onChangeTabRequested);
    on<ChangeSessionRequested>(_onChangeSessionRequested);
  }

  Future<void> _onChangeTabRequested(
    ChangeTabRequested event,
    Emitter<DashboardState> emit,
  ) {
    if (event.tab == state.tab) {
      emit(
        PopTabToRoot(
          tab: event.tab,
        ),
      );
    } else {
      emit(
        DashboardState(
          tab: event.tab,
          routeName: event.routeName,
        ),
      );
    }
    return Future.value();
  }

  Future<void> _onChangeSessionRequested(
    ChangeSessionRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(
      DashboardSessionUpdated(),
    );
  }
}
