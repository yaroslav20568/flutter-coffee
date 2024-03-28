import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinHome extends StatelessWidget {
  const SpinHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
      color: Color.fromRGBO(112, 67, 65, 0.8),
      size: 50.0,
    );
  }
}