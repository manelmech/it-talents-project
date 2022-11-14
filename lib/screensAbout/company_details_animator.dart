import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ittalentsproject/dataAbout/profile.dart';

import 'company_details_page.dart';

class CompanyDetailsAnimator extends StatefulWidget {
  @override
  _CompanyDetailsAnimatorState createState() => _CompanyDetailsAnimatorState();
}

class _CompanyDetailsAnimatorState extends State<CompanyDetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this
    );
    Timer(Duration(seconds: 0), () => _controller.forward(from: 0.0));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompanyDetailsPage(profile: profile, controller: _controller),
    );
  }
}