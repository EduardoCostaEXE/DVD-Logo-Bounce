import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/dvd_logo_viewmodel.dart';

class DvdLogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: Provider.of<DvdLogoViewModel>(context),
            builder: (context, child) {
              final logo = Provider.of<DvdLogoViewModel>(context).logo;
              return Positioned(
                left: logo.position.dx,
                top: logo.position.dy,
                child: Image.asset(
                  'Assets/dvd_logo.png',
                  width: 102.4,
                  height: 41.95,
                  color: logo.color,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}