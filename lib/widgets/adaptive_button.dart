import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/utils/adaptive_widget_utils.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final BoxDecoration? decoration;
  final VoidCallback? onPressed;
  final double? height;
  final double inactiveOpacity;
  final bool isActive;

  const AdaptiveButton({
    super.key,
    required this.child,
    this.decoration,
    required this.onPressed,
    this.height,
    this.inactiveOpacity = 0.5,
    this.isActive = true,
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
    return _buildBoxDecoration(
      child: CupertinoButton(
        child: child,
        onPressed: _getOnPressedCallback(context),
      ),
    );
  }

  Widget _buildMaterialButton(BuildContext context) {
    final BorderRadiusGeometry? borderRadius = decoration?.borderRadius;
    return _buildBoxDecoration(
      child: MaterialButton(
        child: child,
        onPressed: _getOnPressedCallback(context),
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: borderRadius,
              )
            : null,
      ),
    );
  }

  Widget _buildBoxDecoration({
    required Widget child,
  }) {
    return AnimatedOpacity(
      opacity: isActive ? 1.0 : inactiveOpacity,
      duration: Duration(microseconds: 300),
      child: Container(
        decoration: decoration,
        height: height == double.infinity ? null : (height ?? AppDimensions.height.button),
        child: child,
      ),
    );
  }

  VoidCallback? _getOnPressedCallback(BuildContext context) {
    return isActive && onPressed != null
        ? () {
            onPressed?.call();
          }
        : null;
  }
}
