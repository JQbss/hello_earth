part of 'shopping_lists_bloc.dart';

abstract class ShoppingListsEvent extends Equatable {
  const ShoppingListsEvent();

  @override
  List<dynamic> get props => [];
}

class ShoppingListFetchData extends ShoppingListsEvent{
  const ShoppingListFetchData();
}
