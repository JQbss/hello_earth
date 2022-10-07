import 'package:flutter/material.dart';

class ShoppingListDetailsPage extends StatefulWidget {
  const ShoppingListDetailsPage({
    super.key,
  });

  @override
  State<ShoppingListDetailsPage> createState() => _ShoppingListDetailsPageState();
}

//przesyłać argumenty, bez pobierania na nowo
class _ShoppingListDetailsPageState extends State<ShoppingListDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Lista zakupowa'),
    );
  }
}
