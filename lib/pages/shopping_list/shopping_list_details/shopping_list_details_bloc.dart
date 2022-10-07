import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shopping_list_details_event.dart';
part 'shopping_list_details_state.dart';

class ShoppingListDetailsBloc extends Bloc<ShoppingListDetailsEvent, ShoppingListDetailsState> {
  ShoppingListDetailsBloc() : super(ShoppingListDetailsInitial()) {
    on<ShoppingListDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
