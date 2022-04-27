/*
Copyright 2022 Square Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class _LogoAnimated extends AnimatedWidget {
  static final _alignmentTween = AlignmentTween(
    begin: Alignment.center,
    end: Alignment.topCenter,
  );
  static final _sizeTween = Tween<double>(begin: 80.0, end: 48.0);

  _LogoAnimated({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
      alignment: _alignmentTween.evaluate(animation),
      margin: EdgeInsets.symmetric(vertical: 100.0),
      constraints: BoxConstraints(minHeight: 48.0),
      child: Image.asset(
        'icons/ic_jewel.png',
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
      ),
    );
  }
}

/// Displays the square logo with an opening animation
class AnimatedSquareLogo extends StatefulWidget {
  /// initialize with a callback
  AnimatedSquareLogo({
    this.onLogoAnimated,
  });

  /// callback that fires after the logo animation is finished
  final VoidCallback? onLogoAnimated;

  _LogoState createState() => _LogoState();
}

class _LogoState extends State<AnimatedSquareLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    animation.addStatusListener((var status) {
      if (status == AnimationStatus.completed) {
        widget.onLogoAnimated!();
      }
    });
    controller.forward();
  }

  Widget build(BuildContext context) => _LogoAnimated(animation: animation);

  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
