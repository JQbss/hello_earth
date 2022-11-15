part of 'shopping_list_details_bloc.dart';

abstract class ShoppingListDetailsEvent extends Equatable {
  const ShoppingListDetailsEvent();

  @override
  List<dynamic> get props => [];
}

class FetchShoppingList extends ShoppingListDetailsEvent {
  const FetchShoppingList();
}

class ShoppingListChanged extends ShoppingListDetailsEvent {
  final ShoppingListModel? shoppingList;

  const ShoppingListChanged({
    required this.shoppingList,
  });

  @override
  List<dynamic> get props => [
        ...super.props,
        shoppingList,
      ];
}
