extension StringExtensions on String {
  bool get isBlank => trim().isEmpty;
}

extension NullableStringExtension on String? {
  bool get isNullOrBlank => this?.isBlank ?? true;

  bool get isNotNullOrBlank => !(this?.isNullOrBlank ?? true);

  String orEmpty() => this ?? '';
}