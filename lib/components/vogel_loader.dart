import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_radius.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

class VogelLoader extends StatefulWidget {
  final bool isLoading;
  final String title;
  final String description;
  final Widget child;

  const VogelLoader({
    required this.isLoading,
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  _VogelLoaderState createState() => _VogelLoaderState();
}

class _VogelLoaderState extends State<VogelLoader> {
  final _circlesDarkColor = [true, true, true, true];
  var _currentIndex = 0;

  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        _circlesDarkColor[_currentIndex] = !_circlesDarkColor[_currentIndex];
      });
      if (_currentIndex == 3) {
        _currentIndex = 0;
      } else {
        _currentIndex++;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          widget.child,
          if (widget.isLoading)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: VogelSpacing.big1,
              ),
              color: VogelColors.blueDark.withOpacity(0.8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: VogelColors.white),
                    ),
                    SizedBox(height: VogelSpacing.medium1),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: VogelColors.white),
                    ),
                    SizedBox(height: VogelSpacing.medium1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _circle(isColorDark: _circlesDarkColor[0]),
                        _circle(isColorDark: _circlesDarkColor[1]),
                        _circle(isColorDark: _circlesDarkColor[2]),
                        _circle(isColorDark: _circlesDarkColor[3]),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _circle({required bool isColorDark}) {
    return Container(
      width: 24,
      height: 24,
      margin: EdgeInsets.symmetric(horizontal: VogelSpacing.tiny3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(VogelRadius.circular),
        color: isColorDark ? VogelColors.blueMedium : VogelColors.blueLight,
      ),
    );
  }
}
