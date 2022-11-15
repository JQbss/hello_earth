import 'package:flutter/material.dart';
import 'package:hello_earth/routing/dashboard_tabs/shopping_lists_routing.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/bezier_curve_title.dart';

class ShoppingListsPage extends StatefulWidget {
  const ShoppingListsPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListsPage> createState() => _ShoppingListsPageState();
}

class _ShoppingListsPageState extends State<ShoppingListsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const BezierCurveTitle(title: 'Lista zakupowa'),
    );
    // return Container(
    //   child: AdaptiveButton(child: Text('test'),onPressed: () => Navigator.pushNamed(context, ShoppingListsRouting.shoppingListDetails),),
    // );
  }
}
