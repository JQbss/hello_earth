import 'package:flutter_test/flutter_test.dart';
import 'package:hello_earth/extensions/extensions.dart';

main() async {
  final List<int?>? nullList = null;
  final List<int?> integerListWithNulls = [1, 156, null, 43, 23];
  group('Test list extensions', () {
    test('Test filterNotNull', () {
      expect(null, nullList);
      expect([], nullList.filterNotNull());
      expect(5, integerListWithNulls.length);
      expect(true, integerListWithNulls.contains(null));
      expect(4, integerListWithNulls.filterNotNull().length);
      expect(false, integerListWithNulls.filterNotNull().contains(null));
    });
    test('Test orEmptyFilterNotNull', () {
      expect([], nullList.orEmptyFilterNotNull());
      expect(4, integerListWithNulls.orEmptyFilterNotNull().length);
      expect(false, integerListWithNulls.orEmptyFilterNotNull().contains(null));
    });
  });

  final String emptyString = '';
  final String? nullString = null;
  final String? notNullString = 'HelloEarth';
  group('Test string extensions', () {
    test('String is blank', () {
      expect(true, emptyString.isBlank);
    });
    test('String is null or blank', () {
      expect(true, emptyString.isNullOrBlank);
      expect(true, nullString.isNullOrBlank);
      expect(false, notNullString.isNullOrBlank);
    });
    test('String is not null or blank', () {
      expect(false, emptyString.isNotNullOrBlank);
      expect(false, nullString.isNotNullOrBlank);
      expect(true, notNullString.isNotNullOrBlank);
    });
    test('String or empty', () {
      expect('', emptyString.orEmpty());
      expect('', nullString.orEmpty());
      expect(notNullString, notNullString.orEmpty());
    });
  });
}
