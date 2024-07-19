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
                child: Container(
                  width: 50,
                  height: 50,
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