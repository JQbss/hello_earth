import 'package:flutter/material.dart';

class HomeParentPage extends StatefulWidget {
  const HomeParentPage({
    super.key,
  });

  @override
  State<HomeParentPage> createState() => _HomeParentPageState();
}

class _HomeParentPageState extends State<HomeParentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Rodzic'),
    );
  }
}
