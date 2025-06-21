import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // Bắt đầu từ dưới bên trái, cao hơn một chút


  // var firstControlPoint =
  //       Offset(size.width - (size.width / 2), size.height + 80);
  //   var firstEndPoint = Offset(size.width, size.height + 40);

  //   path.quadraticBezierTo(
  //     firstControlPoint.dx,
  //     firstControlPoint.dy,
  //     firstEndPoint.dx,
  //     firstEndPoint.dy,
  //   );

  var firstControlPoint = Offset(size.width / 4, size.height + 50);
    var firstEndPoint = Offset(size.width /1.9, size.height - 80);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );



    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 140);
    var secondEndPoint = Offset(size.width+10, size.height - 35);
    path.quadraticBezierTo(secondControlPoint.dx , secondControlPoint.dy,
        secondEndPoint.dx , secondEndPoint.dy );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
