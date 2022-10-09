part of 'shopping_list_details_bloc.dart';

abstract class ShoppingListDetailsState extends Equatable {
  const ShoppingListDetailsState();

  @override
  List<Object> get props => [];
}

class ShoppingListDetailsInitial extends ShoppingListDetailsState {
  const ShoppingListDetailsInitial();
}

class ShoppingListDetailsLoading extends ShoppingListDetailsState {
  const ShoppingListDetailsLoading();
}

class ShoppingListDetailsSuccess extends ShoppingListDetailsState {
  const ShoppingListDetailsSuccess();
}

class ShoppingListDetailsFailed extends ShoppingListDetailsState {
  const ShoppingListDetailsFailed();
}
