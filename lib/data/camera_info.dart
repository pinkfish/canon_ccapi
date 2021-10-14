library canon_ccapi;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'camera_data.g.dart';

///
/// Information on the camer from the XML on the device, found using upnp
///
abstract class CameraInfo implements Built<CameraInfo, CameraInfoBuilder> {
  /// Serializer for the camera info.
  static Serializer<CameraInfo> get serializer => _$cameraInfoSerializer;

  CameraInfo._();

  /// Create the camera info class with a nifty factory.
  factory CameraInfo([void Function(CameraInfoBuilder) updates]) = _$CameraInfo;

  /// Standard urn:schemas-canon-com:device:ICPO-CameraControlAPIService:1
  String get deviceType;

  /// The product name
  String get friendlyName;

  /// "Canon" (fixed value)
  String get Manufacturer;

  /// "http://www.canon.com" (fixed value)
  String get manufacturerURL;

  /// “Canon Digital Camera” (Fixed value)
  String get modelDescription;

  /// Product Name
  String get modelName;

  /// Serial number
  String get serialNumber;

  /// UUID (Mac Address)
  String get UDN;

  /// urn:schemas-canon-com:service:ICPO-CameraControlAPIService:1
  String get serviceType;

  /// urn:schemas-canon-com:serviceId:ICPO-CameraControlAPIService-1
  String get serviceId;

  /// 0 : Disconnected 1 : Connected
  int get X_onService;

  /// Camera Control API access URL
  String get X_accessURL;

  /// Device Nickname
  String get X_deviceNickname;
}
