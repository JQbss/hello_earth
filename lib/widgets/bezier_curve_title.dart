import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/widgets/clipper.dart';

class BezierCurveTitle extends StatelessWidget {
  final String title;

  const BezierCurveTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Clipper(),
          child: Container(
            color: AppColors.bezierCurveSecondary,
            height: 135.0,
          ),
        ),
        ClipPath(
          clipper: Clipper(),
          child: Container(
            color: AppColors.primary,
            height: 115.0,
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 700),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(top: value * 20),
                  child: child,
                ),
              );
            },
            child: SizedBox(
              width: 150,
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.buttonText,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
