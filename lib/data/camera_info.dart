library canon_ccapi;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'camera_info.g.dart';

///
/// Information on the camera from the XML on the device, found using upnp
///
abstract class CameraInfo implements Built<CameraInfo, CameraInfoBuilder> {
  /// Serializer for the camera info.
  static Serializer<CameraInfo> get serializer => _$cameraInfoSerializer;

  CameraInfo._();

  /// Create the camera info class with a nifty factory.
  factory CameraInfo([void Function(CameraInfoBuilder) updates]) = _$CameraInfo;

  /// Version of the firmware.
  @BuiltValueField(wireName: 'firmwareversion')
  String get firmwareVersion;

  /// "Canon" (fixed value)
  String get manufacturer;

  /// The product name
  @BuiltValueField(wireName: 'productname')
  String get productName;

  /// Guid for the device.
  String get guid;

  /// Serial number
  @BuiltValueField(wireName: 'serialnumber')
  String get serialNumber;

  /// UUID (Mac Address)
  @BuiltValueField(wireName: 'macaddress')
  String get macAddress;

  /// Serialize the CameraInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(CameraInfo.serializer, this)
    as Map<String, dynamic>;
  }

  /// Deserialize the CameraInfo from a map.
  static CameraInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(CameraInfo.serializer, jsonData)
    as CameraInfo;
  }

}
