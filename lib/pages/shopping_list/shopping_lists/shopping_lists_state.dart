part of 'shopping_lists_bloc.dart';

abstract class ShoppingListsState extends Equatable {
  final ShoppingListsModel? shoppingLists;

  const ShoppingListsState({
    required this.shoppingLists,
  });

  @override
  List<dynamic> get props => [
        shoppingLists,
      ];
}

class ShoppingListsInitial extends ShoppingListsState {
  const ShoppingListsInitial()
      : super(
          shoppingLists: null,
        );
}

class ShoppingListsLoading extends ShoppingListsState {
  const ShoppingListsLoading()
      : super(
          shoppingLists: null,
        );
}

class ShoppingListsSuccess extends ShoppingListsState {
  const ShoppingListsSuccess({
    super.shoppingLists,
  });
}

class ShoppingListsFailed extends ShoppingListsState {
  const ShoppingListsFailed()
      : super(
          shoppingLists: null,
        );
}
