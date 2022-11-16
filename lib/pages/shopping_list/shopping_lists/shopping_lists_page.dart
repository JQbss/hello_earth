import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/extensions/extensions.dart';
import 'package:hello_earth/generated/l10n.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/shopping_list/shopping_list_details/shopping_list_details_arguments.dart';
import 'package:hello_earth/pages/shopping_list/shopping_lists/shopping_lists_bloc.dart';
import 'package:hello_earth/routing/dashboard_tabs/shopping_lists_routing.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';
import 'package:hello_earth/ui/models/role_model.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';
import 'package:hello_earth/ui/models/shopping_lists_model.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';
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
          child = AppProgressIndicator();
        } else {
          child = _buildBody();
        }
        return child;
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: BezierCurveTitle(
              title: S.of(context).shoppingListTitle,
            ),
          ),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildList() {
    final ShoppingListsModel? shoppingListsModels = bloc.state.shoppingLists;
    if (shoppingListsModels == null) {
      return Container(
        height: 120,
        color: Colors.red,
        child: BezierCurveTitle(
          title: S.of(context).shoppingListTitle,
        ),
      );
    }
    final List<ShoppingListModel> shoppingLists =
        (shoppingListsModels.shoppingLists?.entries.map((shoppingList) => shoppingList.value).toList() ?? [])
            .filterNotNull();
    final List<String> shoppingListsKeys =
        (shoppingListsModels.shoppingLists?.entries.map((shoppingList) => shoppingList.key).toList() ?? [])
            .filterNotNull();
    if (shoppingLists.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, index) => _buildShoppListButton(
        shoppingList: shoppingLists[index],
        uid: shoppingListsKeys[index],
      ),
      itemCount: shoppingLists.length,
    );
  }

  Widget _buildShoppListButton({
    required ShoppingListModel? shoppingList,
    required String uid,
  }) {
    if (bloc.profile?.role == RoleModel.parent && !(shoppingList?.isParentVisible ?? false)) {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: AppColors.black.withOpacity(0.3)),
          bottom: BorderSide(width: 1.0, color: AppColors.black.withOpacity(0.3)),
        ),
      ),
      child: AdaptiveButton(
        child: Row(
          children: [
            if (_checkIfAllItemsAreBought(shoppingList?.ingredients))
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  color: AppColors.primary,
                  Icons.check_circle_outline,
                ),
              )
            else
              SizedBox.shrink(),
            Text(
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
              shoppingList?.missionName ?? '',
            ),
            Spacer(),
            Text(
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              '(${shoppingList?.ingredients?.length.toString() ?? '-'})',
            ),
          ],
        ),
        onPressed: () {
          final ShoppingListDetailsArguments arguments = ShoppingListDetailsArguments(
            ingredients: shoppingList?.ingredients,
            isParentVisible: shoppingList?.isParentVisible,
            missionName: shoppingList?.missionName,
            uid: uid,
          );
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamed(
            ShoppingListsRouting.shoppingListDetails,
            arguments: arguments,
          );
        },
      ),
    );
  }

  bool _checkIfAllItemsAreBought(List<IngredientModel?>? ingredient) {
    if (ingredient != null && ingredient.isNotEmpty) {
      final List<IngredientModel?> unBoughtProducts = ingredient
          .where(
            (element) => !(element?.isBought ?? false),
          )
          .toList();
      return unBoughtProducts.isEmpty;
    }
    return false;
  }
}
