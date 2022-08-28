class AppDimensions {
  static const double defaultPadding = 32.0;
  static const double defaultRadius = 15.0;
  static const double appCheckboxTappableMargin = 8.0;

  static final _Height height = _Height();
  static final _Width width = _Width();

  const AppDimensions._();
}

class _Height {
  final double button = 40;
}

class _Width {
  final double button = 250;
}