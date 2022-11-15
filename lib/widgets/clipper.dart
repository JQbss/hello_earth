import 'package:flutter/cupertino.dart';

class Clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final firstStart = Offset(size.width /5 , size.height);
    final firstEnd = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    final secondStart = Offset(size.width - (size.width / 3.24), size.height - 60);
    final secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
