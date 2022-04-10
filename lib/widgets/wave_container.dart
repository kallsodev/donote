import 'package:flutter/material.dart';

class WaveContainer extends StatelessWidget {
  final double maxWidth;

  const WaveContainer({Key? key, required this.maxWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipPath(
          child: Container(
            width: maxWidth,
            height: constraints.maxHeight,
            color: Colors.white,
          ),
          clipper: WaveClipper(),
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 30);
    path.quadraticBezierTo(
      size.width / 4,
      0,
      size.width / 2,
      20,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      40,
      size.width,
      10,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => true;
}
