import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    double super.elevation = 2,
  }) : super(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 80,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}
