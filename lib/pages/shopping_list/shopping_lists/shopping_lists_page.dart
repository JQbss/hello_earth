import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/extensions/extensions.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/shopping_list/shopping_lists/shopping_lists_bloc.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';
import 'package:hello_earth/ui/models/shopping_lists_model.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/bezier_curve_title.dart';

class ShoppingListsPage extends StatefulWidget {
  const ShoppingListsPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListsPage> createState() => _ShoppingListsPageState();
}

class _ShoppingListsPageState extends BlocPageState<ShoppingListsPage, ShoppingListsBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      const ShoppingListFetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListsBloc, ShoppingListsState>(
      builder: (context, state) {
        final Widget child;
        if (state is ShoppingListsLoading) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          child = _buildBody();
        }
        return child;
      },
    );
  }

  Widget _buildBody() {
    final ShoppingListsModel? shoppingListsModels = bloc.state.shoppingLists;
    if (shoppingListsModels == null) return const SizedBox.shrink();
    final List<ShoppingListModel> shoppingLists =
        (shoppingListsModels.shoppingLists?.entries.map((shoppingList) => shoppingList.value).toList() ?? [])
            .filterNotNull();
    if(shoppingLists.isEmpty) return const SizedBox.shrink();
    return SingleChildScrollView(
      child: ListView.builder(
        itemBuilder: (_, index) => _buildShoppListButton(
          shoppingLists[index],
        ),
        itemCount: shoppingLists.length,
      ),
    );
  }

  Widget _buildShoppListButton(ShoppingListModel? shoppingListModel) {
    return AdaptiveButton(child: Text('asd'), onPressed: () => {});
  }
}
