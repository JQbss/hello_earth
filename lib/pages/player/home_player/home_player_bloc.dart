import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_player_event.dart';
part 'home_player_state.dart';

class HomePlayerBloc extends Bloc<HomePlayerEvent, HomePlayerState> {
  HomePlayerBloc() : super(HomePlayerInitial());
}
