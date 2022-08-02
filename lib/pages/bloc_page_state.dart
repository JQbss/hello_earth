import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocPageState<W extends StatefulWidget, B extends Bloc> extends State<W>{
  @protected
  late final B bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<B>(context);
  }
}