part of 'shopping_list_details_bloc.dart';

abstract class ShoppingListDetailsState extends Equatable {
  const ShoppingListDetailsState();
}

class ShoppingListDetailsInitial extends ShoppingListDetailsState {
  @override
  List<Object> get props => [];
}
