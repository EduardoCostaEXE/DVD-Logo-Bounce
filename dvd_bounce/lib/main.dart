import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/dvd_logo_viewmodel.dart';
import 'views/dvd_logo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DvdLogoViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final size = MediaQuery.of(context).size;
              Provider.of<DvdLogoViewModel>(context, listen: false)
                  .startAnimation(size);
            });
            return DvdLogoView();
          },
        ),
      ),
    );
  }
}