import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/session/session_bloc.dart';
import 'package:hello_earth/commons/unique_prop_provider.dart';
import 'package:hello_earth/pages/dashboard/commons/dashboard_tab.dart';
import 'package:hello_earth/storages/secure_storage.dart';
import 'package:hello_earth/storages/session_storage.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final SessionBloc sessionBloc;
  final SessionStorage sessionStorage;

  DashboardBloc({
    required this.sessionBloc,
  })  : sessionStorage = sessionBloc.sessionStorage,
        super(const DashboardInitial()) {
    on<ChangeTabRequested>(_onChangeTabRequested);
    on<CheckSessionRequested>(_onCheckSessionRequested);
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

  Future<void> _onCheckSessionRequested(
    CheckSessionRequested event,
    Emitter<DashboardState> emit,
  ) async {
    final DashboardState entryState = state;
    emit(
      CheckSessionInProgress(entryState),
    );
    try {
      final SessionState sessionState = sessionBloc.state;
      final bool isChild = await sessionStorage.hasChildToken();
      final bool isParent = await sessionStorage.hasParentToken();
      // if (sessionState is! SessionActive && !isChild && !isParent){
      //
      // }
      emit(
        DashboardState(
          tab: entryState.tab,
        ),
      );
      //final SessionState sessionState = sessionB
    } catch (error) {
      emit(
        CheckSessionFailure(state),
      );
    }
    return Future.value();
  }
}
