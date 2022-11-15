import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/extensions/extensions.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_bloc.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/widgets/shopping_list_details_more_bottom_sheet.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/widgets/shopping_list_products.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

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
      const FetchShoppingList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListDetailsBloc, ShoppingListDetailsState>(
      builder: (context, state) {
        final Widget child;
        if (state is ShoppingListDetailsInitial) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          child = _buildBody();
        }
        return SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 250,
            ),
            child: Scaffold(
              appBar: _buildAppBar(),
              backgroundColor: AppColors.appBackground,
              body: child,
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: [
        _buildAppBarAction(),
      ],
      title: Text(
        bloc.state.shoppingList?.missionName ?? '',
      ),
    );
  }

  Widget _buildAppBarAction() {
    return AdaptiveButton(
      onPressed: _showMoreBottomSheet,
      child: const Icon(
        Icons.more_horiz,
      ),
    );
  }

  Future<void> _showMoreBottomSheet() async {
    ShoppingListDetailsMoreBottomSheet(
      shoppingList: bloc.state.shoppingList,
      onShareButton: (isVisible) {
        setState(() {
          final ShoppingListModel? shoppingListModel = bloc.state.shoppingList;
          shoppingListModel?.isParentVisible = isVisible;
          bloc.add(
            ShoppingListChanged(
              shoppingList: shoppingListModel,
            ),
          );
          Navigator.of(context).pop();
        });
      },
    ).show(context);
  }

  Widget _buildBody() {
    final ShoppingListModel? shoppingList = bloc.state.shoppingList;
    if (shoppingList == null) return const SizedBox.shrink();
    final List<IngredientModel> products = shoppingList.ingredients.filterNotNull();
    return ShoppingListProducts(
      products: products,
      onProductsChanged: (products) {
        final ShoppingListModel? shoppingListModel = bloc.state.shoppingList;
        shoppingListModel?.ingredients = products;
        bloc.add(
          ShoppingListChanged(
            shoppingList: shoppingListModel,
          ),
        );
      },
    );
  }
}
