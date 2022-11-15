part of 'shopping_list_details_bloc.dart';

abstract class ShoppingListDetailsState extends Equatable {
  final ShoppingListModel? shoppingList;

  const ShoppingListDetailsState({
    required this.shoppingList,
  });

  @override
  List<Object> get props => [];
}

class ShoppingListDetailsInitial extends ShoppingListDetailsState {
  const ShoppingListDetailsInitial()
      : super(
          shoppingList: null,
        );
}

class ShoppingListDetailsLoading extends ShoppingListDetailsState {
  const ShoppingListDetailsLoading()
      : super(
          shoppingList: null,
        );
}

class ShoppingListDetailsSuccess extends ShoppingListDetailsState {
  const ShoppingListDetailsSuccess({
    required super.shoppingList,
  });
}

class ShoppingListDetailsFailed extends ShoppingListDetailsState {
  const ShoppingListDetailsFailed()
      : super(
          shoppingList: null,
        );
}
