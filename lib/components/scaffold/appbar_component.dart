import 'package:flutter/material.dart';

class AppbarComponent extends StatelessWidget {
  final String title;
  const AppbarComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
