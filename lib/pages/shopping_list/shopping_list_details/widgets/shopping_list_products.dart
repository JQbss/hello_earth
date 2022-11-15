import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';

class ShoppingListProducts extends StatefulWidget {
  final List<IngredientModel> products;
  final void Function(List<IngredientModel>) onProductsChanged;

  const ShoppingListProducts({
    required this.products,
    required this.onProductsChanged,
  });

  @override
  State<ShoppingListProducts> createState() => _ShoppingListProductsState();
}

class _ShoppingListProductsState extends State<ShoppingListProducts> {
  late List<IngredientModel> _products = widget.products;

  @override
  void didUpdateWidget(covariant ShoppingListProducts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.products == widget.products) return;
    setState(() {
      _products = widget.products;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<IngredientModel> unBoughtProducts = _products
        .where(
          (element) => !(element.isBought ?? false),
        )
        .toList();

    final List<IngredientModel> boughtProducts = _products
        .where(
          (element) => element.isBought ?? false,
        )
        .toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
        ),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) => _buildProductCell(
                unBoughtProducts[index],
              ),
              itemCount: unBoughtProducts.length,
            ),
            Container(
              color: AppColors.disabled,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    //child: Container(
                    child: Text(
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                      'Kupoine',
                    ),
                    //),
                  ),
                  ...boughtProducts.asMap().entries.map(
                        (entry) => _buildProductCell(
                          entry.value,
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCell(IngredientModel ingredientModel) {
    return CheckboxListTile(
      activeColor: AppColors.primary,
      checkColor: AppColors.buttonText,
      title: Padding(
        padding: EdgeInsets.all(AppDimensions.padding.text),
        child: Text(
          style: TextStyle(
            decoration: ingredientModel.isBought ?? false ? TextDecoration.lineThrough: TextDecoration.none,
          ),
          ingredientModel.name ?? '',
        ),
      ),
      value: ingredientModel.isBought ?? false,
      onChanged: (_) {
        setState(() {
          ingredientModel.isBought = !(ingredientModel.isBought ?? false);
          widget.onProductsChanged(_products);
        });
      },
    );
  }
}
