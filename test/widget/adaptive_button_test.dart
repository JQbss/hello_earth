import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

import '../utils/material_app_builder_utils.dart';

main() async {
  group('Test adaptive button', () {
    testWidgets('Test adaptive button', (widgetTester) async {
      final List<String> testList = ['test1'];
      final String buttonText = 'Adaptive Button';
      final Widget button = AdaptiveButton(
        child: Text(buttonText),
        onPressed: () => testList.add('test2'),
      );
      await widgetTester.pumpWidget(
        MaterialAppBuilderUtils.buildSimpleMaterialApp(
          child: button,
        ),
      );

      final Finder buttonTextFinder = find.text(buttonText);

      expect(buttonTextFinder, findsOneWidget);
      expect(1, testList.length);
      await widgetTester.tap(buttonTextFinder);
      expect(2, testList.length);
    });

    testWidgets('Test inactive adaptive button', (widgetTester) async {
      final List<String> testList = ['test1'];
      final String buttonText = 'Adaptive Button';
      final Widget button = AdaptiveButton(
        child: Text(buttonText),
        onPressed: () => testList.add('test2'),
        isActive: false,
      );
      await widgetTester.pumpWidget(
        MaterialAppBuilderUtils.buildSimpleMaterialApp(
          child: button,
        ),
      );

      final Finder buttonTextFinder = find.text(buttonText);

      expect(buttonTextFinder, findsOneWidget);
      expect(1, testList.length);
      await widgetTester.tap(buttonTextFinder);
      expect(1, testList.length);
    });
  });
}
