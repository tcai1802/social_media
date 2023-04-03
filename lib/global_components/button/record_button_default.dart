import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordButtonDefault extends StatefulWidget {
  const RecordButtonDefault({
    super.key,
    required this.second,
    this.onTap,
    this.onPressLong,
    this.onPressEnd,
  });
  final int second;
  final Function? onTap;
  final Function? onPressLong;
  final Function? onPressEnd;
  @override
  State<RecordButtonDefault> createState() => _RecordButtonDefaultState();
}

class _RecordButtonDefaultState extends State<RecordButtonDefault>
    with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  Tween<double> rotationTween = Tween(begin: 0.0, end: 1.0);

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.second),
    );

    animation = rotationTween.animate(controller!)
      ..addListener(() {
        if (!mounted) return;
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 80.h),
      child: GestureDetector(
        onTap: () => widget.onTap != null ? widget.onTap!() : () {},
        onLongPress: () {
          if (widget.onPressLong != null) {
            widget.onPressLong!();
          }
          controller!.forward();
        },
        onLongPressEnd: (details) {
          if (widget.onPressEnd != null) {
            widget.onPressEnd!();
          }
          controller!.reset();
          controller!.stop();
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(4.h),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4.h),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CustomPaint(
                painter: GradientArcPainter(
                  progress: animation!.value,
                  colorList: const [
                    Color(0xFFFBAA47),
                    Color(0xFFD91A46),
                    Color(0xFFA60F93),
                  ],
                  width: 4.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GradientArcPainter extends CustomPainter {
  const GradientArcPainter({
    required this.progress,
    required this.colorList,
    required this.width,
  });
  final double progress;
  final List<Color> colorList;
  final double width;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = SweepGradient(
      startAngle: 3 * pi / 2,
      endAngle: 7 * pi / 2,
      tileMode: TileMode.repeated,
      colors: colorList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - (width / 2);
    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return true;
  }
}
