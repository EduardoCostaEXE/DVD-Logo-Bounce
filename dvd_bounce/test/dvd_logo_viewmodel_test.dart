// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../lib/viewmodels/dvd_logo_viewmodel.dart';
import '../lib/models/dvd_logo.dart';

void main() {
  group('DvdLogoViewModel Tests', () {
    late DvdLogoViewModel viewModel;

    setUp(() {
      viewModel = DvdLogoViewModel();
    });

    test('Initial position is (0,0)', () {
      expect(viewModel.logo.position, Offset(0, 0));
    });

    test('Initial color is blue', () {
      expect(viewModel.logo.color, Colors.blue);
    });

    test('Position updates correctly', () {
      final size = Size(300, 300);
      viewModel.startAnimation(size);

      expect(viewModel.logo.position.dx, inInclusiveRange(0, size.width));
      expect(viewModel.logo.position.dy, inInclusiveRange(0, size.height));
    });

    test('Color changes on boundary hit', () async {
      final size = Size(50, 50);
      viewModel.logo.position = Offset(size.width - 1, size.height - 1);
      final initialColor = viewModel.logo.color;

      viewModel.logo.position = Offset(size.width, size.height);
      viewModel.startAnimation(size);
      await Future.delayed(Duration(milliseconds: 100));

      expect(viewModel.logo.color, isNot(initialColor));
    });
  });
}