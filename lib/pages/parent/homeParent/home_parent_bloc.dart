import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_parent_event.dart';
part 'home_parent_state.dart';

class HomeParentBloc extends Bloc<HomeParentEvent, HomeParentState> {
  HomeParentBloc() : super(HomeParentInitial());
}
