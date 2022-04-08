import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as vector;

class WaveContainer extends StatefulWidget {
  final double maxWidth;

  const WaveContainer({Key? key, required this.maxWidth}) : super(key: key);

  @override
  _WaveContainerState createState() => _WaveContainerState();
}

class _WaveContainerState extends State<WaveContainer> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  List<Offset> animList1 = [];
  int xOffset = 50;
  int yOffset = 10;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 6));

    animationController.addListener(() {
      animList1.clear();
      for (int i = -2 - xOffset; i <= widget.maxWidth + 2; i++) {
        animList1.add(Offset(
            i.toDouble() + xOffset,
            sin((animationController.value * 360 - i) % 360 * vector.degrees2Radians) * 10 +
                yOffset));
      }
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
  builder: (context, constraints) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) => ClipPath(
        child: Container(
          width: widget.maxWidth,
          height: constraints.maxHeight,
          color: Colors.white,
        ),
        clipper: WaveClipper(animationController.value, animList1),
      ),
    );
  },
);
  }
}


class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => animation != oldClipper.animation;
}

