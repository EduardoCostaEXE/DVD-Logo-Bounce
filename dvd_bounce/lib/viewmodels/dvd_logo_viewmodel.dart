import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/dvd_logo.dart';

class DvdLogoViewModel extends ChangeNotifier {
  DvdLogo _logo;
  double _dx = 1.0;
  double _dy = 1.0;
  final double _speed = 1;
  final double _width = 102.4;
  final double _height = 41.95;
  final Random _random = Random();

  DvdLogoViewModel()
      : _logo = DvdLogo(position: Offset(0, 0), color: Colors.blue);

  DvdLogo get logo => _logo;

  void startAnimation(Size screenSize) {
    Timer.periodic(Duration(milliseconds: 16), (timer) {
      _moveLogo(screenSize);
    });
  }

  void _moveLogo(Size screenSize) {
    double newX = _logo.position.dx + _dx * _speed;
    double newY = _logo.position.dy + _dy * _speed;

    if (newX <= 0 || newX + _width >= screenSize.width) {
      _dx = -_dx;
      _changeColor();
    }
    if (newY <= 0 || newY + _height >= screenSize.height) {
      _dy = -_dy;
      _changeColor();
    }

    _logo = DvdLogo(position: Offset(newX, newY), color: _logo.color);
    notifyListeners();
  }

  void _changeColor() {
    _logo = DvdLogo(
      position: _logo.position,
      color: Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      ),
    );
    notifyListeners();
  }
}
