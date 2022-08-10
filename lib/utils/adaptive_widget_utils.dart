import 'package:flutter/material.dart';

class AdaptiveWidgetUtils {
  const AdaptiveWidgetUtils._();

  static AdaptiveWidgetType getWidgetTypeOf(
    BuildContext context, {
    required Platform platform,
  }) {
    switch (platform) {
      case Platform.adaptive:
        final ThemeData theme = Theme.of(context);
        switch (theme.platform) {
          case TargetPlatform.iOS:
            return AdaptiveWidgetType.cupertino;
          default:
            return AdaptiveWidgetType.material;
        }
      case Platform.cupertino:
        return AdaptiveWidgetType.cupertino;
      default:
        return AdaptiveWidgetType.material;
    }
  }
}

enum AdaptiveWidgetType {
  cupertino,
  material,
}

enum Platform {
  adaptive,
  cupertino,
  material,
}
