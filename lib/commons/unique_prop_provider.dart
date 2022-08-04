import 'package:flutter/material.dart';

class UniquePropProvider {
  const UniquePropProvider._();

  static _UniqueProp get() => _UniqueProp();
}

@immutable
class _UniqueProp {
  _UniqueProp();
}
