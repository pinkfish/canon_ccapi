import 'package:flutter/material.dart';
import 'package:upnp/upnp.dart';

class CameraCard extends StatelessWidget {
  final Device device;
  final GestureTapCallback? onTap;

  const CameraCard(this.device, {this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(device.friendlyName),
        subtitle: Text('${device.modelName} ${device.manufacturer}'),
      ),
    );
  }
}
