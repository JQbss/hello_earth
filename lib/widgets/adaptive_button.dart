import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_earth/utils/adaptive_widget_utils.dart';

class AdaptiveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const AdaptiveButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AdaptiveWidgetType adaptiveWidgetType = AdaptiveWidgetUtils.getWidgetTypeOf(
      context,
      platform: Platform.adaptive,
    );
    switch (adaptiveWidgetType) {
      case AdaptiveWidgetType.cupertino:
        return _buildCupertinoButton(context);
      default:
        return _buildMaterialButton(context);
    }
  }

  Widget _buildCupertinoButton(BuildContext context) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }

  Widget _buildMaterialButton(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
