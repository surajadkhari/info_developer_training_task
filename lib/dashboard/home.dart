import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: size.height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffEDEAEA),
                    borderRadius: BorderRadius.circular(80)),
              ),
              const Positioned(
                left: 140,
                top: -80,
                child: CircleAvatar(
                  maxRadius: 118,
                  backgroundColor: Color(0xff12EBF9),
                ),
              ),
              const Positioned(
                left: 145,
                top: -120,
                child: CircleAvatar(
                  maxRadius: 120,
                  backgroundColor: Colors.white,
                ),
              ),
              const Positioned(
                right: 140,
                bottom: -80,
                child: CircleAvatar(
                  maxRadius: 118,
                  backgroundColor: Color(0xff12EBF9),
                ),
              ),
              const Positioned(
                right: 145,
                bottom: -120,
                child: CircleAvatar(
                  maxRadius: 120,
                  backgroundColor: Colors.white,
                ),
              ),

              Positioned(
                right: 0,
                left: 0,
                bottom: 180,
                child: Image.asset(
                  "assets/image/shape.jpg",
                  height: size.height * 0.16,
                ),
              ),
              // Positioned(
              //   child: CustomPaint(
              //     size: Size(size.width, (size.height * 0.3).toDouble()),
              //     painter: RPS1CustomPainter(),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class RPS1CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff12EBF9)
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.2;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4157583, size.height * 0.6843143);
    path0.lineTo(size.width * 0.4991667, size.height * 0.3628571);
    path0.lineTo(size.width * 0.5488583, size.height * 0.6871000);
    path0.lineTo(size.width * 0.6877667, size.height * 0.9317714);
    path0.lineTo(size.width * 0.4785917, size.height * 0.7905143);
    path0.lineTo(size.width * 0.2483333, size.height * 0.8657143);
    path0.lineTo(size.width * 0.4174583, size.height * 0.6818714);
    path0.lineTo(size.width * 0.4187333, size.height * 0.6818857);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4157583, size.height * 0.6843143);
    path0.lineTo(size.width * 0.4991667, size.height * 0.3628571);
    path0.lineTo(size.width * 0.5488583, size.height * 0.6871000);
    path0.lineTo(size.width * 0.6877667, size.height * 0.9317714);
    path0.lineTo(size.width * 0.4785917, size.height * 0.7905143);
    path0.lineTo(size.width * 0.2483333, size.height * 0.8657143);
    path0.lineTo(size.width * 0.4174583, size.height * 0.6818714);
    path0.lineTo(size.width * 0.4187333, size.height * 0.6818857);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
