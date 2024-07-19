import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import '../lib/viewmodels/dvd_logo_viewmodel.dart';
import '../lib/views/dvd_logo_view.dart';

void main() {
  testWidgets('DvdLogoView displays logo', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => DvdLogoViewModel(),
        child: MaterialApp(
          home: DvdLogoView(),
        ),
      ),
    );

    expect(find.byType(AnimatedBuilder), findsOneWidget);
    expect(find.byType(Positioned), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('Logo moves and changes color', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => DvdLogoViewModel(),
        child: MaterialApp(
          home: DvdLogoView(),
        ),
      ),
    );

    final viewModel = Provider.of<DvdLogoViewModel>(tester.element(find.byType(DvdLogoView)), listen: false);
    final initialPosition = viewModel.logo.position;
    final initialColor = viewModel.logo.color;

    viewModel.logo.position = Offset(299, 299); // Próximo ao limite da tela
    final size = Size(300, 300);
    viewModel.startAnimation(size);
    await Future.delayed(Duration(milliseconds: 100));
    await tester.pump();

    expect(viewModel.logo.position, isNot(initialPosition));
    expect(viewModel.logo.color, isNot(initialColor));
  });
}