import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:canon_ccapi/canon_ccapi.dart';
import 'package:upnp/upnp.dart';

void main() {
  runApp(const CanonCCAPIDemo());
}

class CanonCCAPIDemo extends StatefulWidget {
  const CanonCCAPIDemo({Key? key}) : super(key: key);

  @override
  State<CanonCCAPIDemo> createState() => _CanonCCAPIDemoState();
}

class _CanonCCAPIDemoState extends State<CanonCCAPIDemo> {
  var discoverer = DeviceDiscoverer();


  @override
  void initState() {
super.initState();
discoverer.getDevices(type: )
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ,
        ),
      ),
    );
  }
}
