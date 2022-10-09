import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_bloc.dart';

class ShoppingListDetailsPage extends StatefulWidget {
  const ShoppingListDetailsPage({
    super.key,
  });

  @override
  State<ShoppingListDetailsPage> createState() => _ShoppingListDetailsPageState();
}

class _ShoppingListDetailsPageState extends BlocPageState<ShoppingListDetailsPage, ShoppingListDetailsBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      FetchShoppingList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListDetailsBloc, ShoppingListDetailsState>(
      builder: (context, state) {
        return Scaffold(
          body: Text('Lista zakupowa'),
        );
      },
    );
  }
}
