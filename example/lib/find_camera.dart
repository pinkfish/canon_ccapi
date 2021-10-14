import 'package:flutter/material.dart';
import 'package:upnp/upnp.dart';

import 'camera_card.dart';

class FindCamera extends StatefulWidget {
  const FindCamera({Key? key}) : super(key: key);

  @override
  _FindCameraState createState() => _FindCameraState();
}

class _FindCameraState extends State<FindCamera> {
  final _discoverer = DeviceDiscoverer();
  var _devices = <Device>[];
  var _searching = true;
  Device? _camera = null;

  @override
  void initState() {
    super.initState();
    _discoverer
        .getDevices(type: CommonDevices.CANON_CAMERA)
        .then((arr) => setState(() {
              _devices = arr;
              _searching = false;
            }));
  }

  void _openCamera(Device d) {
    setState(() {
      _camera = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_devices.isEmpty) {
      if (_searching) {
        return const Text('Searching for camera');
      }
      return const Text('Cannot find any canon cameras');
    }
    return Column(
      children: _devices
          .map((e) => CameraCard(
                e,
                onTap: () => _openCamera(e),
              ))
          .toList(),
    );
  }
}
