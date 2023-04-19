import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'half_a_circle.dart';

class CustomAnimation extends HookWidget {
  const CustomAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstController =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    final secondControler =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    final thirdControler =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    final fourthControler =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    final rotateZAnimation = Tween(
      begin: 0.0,
      end: pi,
    ).animate(
        CurvedAnimation(parent: firstController, curve: Curves.bounceOut));

    final rotateAllZAnimation = Tween(
      begin: 0.0,
      end: -pi,
    ).animate(
        CurvedAnimation(parent: fourthControler, curve: Curves.bounceOut));

    final rotateXAnimation = Tween(
      begin: 0.0,
      end: pi,
    ).animate(
      CurvedAnimation(parent: secondControler, curve: Curves.easeInCirc),
    );

    firstController.forward();
    useEffect(() {
      var lastFirst = AnimationStatus.forward;
      var lastSecond = AnimationStatus.completed;
      var lastThird = AnimationStatus.completed;
      var lastFourth = AnimationStatus.completed;
      firstController.addStatusListener((status) {
        if (lastFirst == AnimationStatus.forward) {
          secondControler.forward();
        } else if (lastFirst == AnimationStatus.reverse) {
          fourthControler.reverse();
        }

        lastFirst = status;
      });
      secondControler.addStatusListener((status) {
        if (lastSecond == AnimationStatus.forward) {
          thirdControler.forward();
        } else if (lastSecond == AnimationStatus.reverse) {
          firstController.reverse();
        }

        lastSecond = status;
      });
      thirdControler.addStatusListener((status) {
        if (lastThird == AnimationStatus.forward) {
          fourthControler.forward();
        } else if (lastThird == AnimationStatus.reverse) {
          secondControler.reverse();
        }

        lastThird = status;
      });

      fourthControler.addStatusListener((status) {
        if (lastFourth == AnimationStatus.forward) {
          thirdControler.reverse();
        } else if (lastFourth == AnimationStatus.reverse) {
          firstController.forward();
        }

        lastFourth = status;
      });
      return null;
    });

    return ScaleTransition(
      scale: thirdControler.drive(
        Tween(begin: 1, end: 1.8),
      ),
      child: AnimatedBuilder(
        animation: Listenable.merge([
          secondControler,
          fourthControler,
        ]),
        builder: (context, child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateX(rotateXAnimation.value)
            ..rotateZ(rotateAllZAnimation.value),
          child: child,
        ),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: rotateZAnimation,
              builder: (context, child) => Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()..rotateZ(rotateZAnimation.value),
                child: child,
              ),
              child: CustomPaint(
                painter: HalfACircle(0, Colors.amber),
                child: const SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity(),
              child: CustomPaint(
                painter: HalfACircle(180, Colors.blue),
                child: const SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
