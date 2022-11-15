import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/shopping_list_model.dart';

class ShoppingListDetailsMoreBottomSheet {
  final ShoppingListModel? shoppingList;
  final Function(bool?) onShareButton;

  const ShoppingListDetailsMoreBottomSheet({
    required this.shoppingList,
    required this.onShareButton,
  });

  Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: _buildBody(context),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return CheckboxListTile(
      activeColor: AppColors.primary,
      checkColor: AppColors.buttonText,
      title: Padding(
        padding: EdgeInsets.all(AppDimensions.padding.text),
        child: _checkboxListTile(),
      ),
      value: shoppingList?.isParentVisible ?? false,
      onChanged: onShareButton,
    );
  }

  Widget _checkboxListTile() {
    if (shoppingList?.isParentVisible ?? false)
      return Text(
        'Lista zakupowa jest udostępniona opiekunowi',
      );
    return Text(
      'Czy udostępnić listę zakupową opiekunowi?',
    );
  }
}
