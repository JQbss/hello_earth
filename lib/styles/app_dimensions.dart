class AppDimensions {
  static const double defaultPadding = 32.0;
  static const double appCheckboxTappableMargin = 8.0;

  static final _Height height = _Height();
  static final _Width width = _Width();
  static final _Radius radius = _Radius();


  const AppDimensions._();
}

class _Height {
  final double button = 40;
}

class _Width {
  final double button = 250;
}
class _Radius  {
  final double input = 15.0;
  final double toggleButton = 20.0;
  final double button = 15.0;
}