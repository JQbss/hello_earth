extension NullableListOfNullablesExtensions<T> on List<T?>? {
  List<T> filterNotNull() {
    final List<T?>? list = this;
    if (list == null) {
      return [];
    }
    return list.whereType<T>().toList();
  }

  List<T> orEmptyFilterNotNull() => orEmpty().filterNotNull();
}

extension NullableListExtensions<T> on List<T>? {
  List<T> orEmpty() => this ?? [];
}
