import 'package:canon_ccapi_example/find_camera.dart';
import 'package:flutter/material.dart';

import 'find_camera.dart';

void main() {
  runApp(const CanonCCAPIDemo());
}

class CanonCCAPIDemo extends StatelessWidget {
  const CanonCCAPIDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Canon camera'),
        ),
        body:  Center(
          child: FindCamera()
        ),
      ),
    );
  }

}
