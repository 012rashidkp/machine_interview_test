import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loadingbar extends StatelessWidget {
  final Color? color;
  const Loadingbar({ this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
