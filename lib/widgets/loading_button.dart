import 'package:flutter/material.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class LoadingButton extends StatefulWidget {
  final double height;
  final bool isLoading;
  final GlobalKey globalKey;
  final Color? loaderColor;
  final AdaptiveButton child;

  const LoadingButton({
    this.height = 50.0,
    required this.isLoading,
    required this.globalKey,
    this.loaderColor,
    required this.child,
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: widget.globalKey,
      width: double.infinity,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: widget.child,
          ),
          Visibility(
            visible: widget.isLoading,
            child: _buildLoaderContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoaderContainer() {
    return Center(
      child: Container(
        decoration: widget.child.decoration,
        width: double.infinity,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.height,
              child: _buildLoader(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.loaderColor ?? AppColors.appBackground),
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
