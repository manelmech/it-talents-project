import 'package:flutter/material.dart';

class CompanyDetailsIntroAnimation {
  final AnimationController controller;
 final Animation<double> bgdropOpacity;
  final Animation<double> bgdropBlur;
  final Animation<double> avatarScale;
  final Animation<double> titleFade;
  final Animation<double> loactionFade;
  final Animation<double> dividerWidth;
  final Animation<double> descriptionFade;
  final Animation<Offset> coursesSLide;

  CompanyDetailsIntroAnimation(this.controller) :
  bgdropOpacity = Tween(begin: 0.0, end: 0.5).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.000, 0.250, curve: Curves.ease)
    )
  ),
  bgdropBlur = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.125, 0.400, curve: Curves.ease)
    )
  ),
  avatarScale = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.250, 0.400, curve: Curves.elasticOut)
    )
  ),
  titleFade = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.400, 0.500, curve: Curves.ease)
    )
  ),
  loactionFade = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.500, 0.600, curve: Curves.ease)
    )
  ),
  dividerWidth = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.600, 0.700, curve: Curves.ease)
    )
  ),
  descriptionFade = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.700, 0.800, curve: Curves.ease)
    )
  ),
  coursesSLide = Tween(begin: Offset(2.0, 0.0), end: Offset(0.0, 0.0)).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(0.800, 0.900, curve: Curves.ease)
    )
  );}
