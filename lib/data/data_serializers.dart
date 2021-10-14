import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'battery_info.dart';
import 'lens_info.dart';
import 'temperature_info.dart';
import 'api_info.dart';
import 'camera_info.dart';
import 'storage_info.dart';

part 'data_serializers.g.dart';

///
/// Collection of generated serializers for the built_value chat example.
///
@SerializersFor([
  ApiInfo,
  ApiList,
  CameraInfo,
  StorageInfo,
  StorageInfoList,
  AccessCapability,
  BatteryInfo,
  BatteryKind,
  BatteryLevel,
  BatteryInfo,
  BatteryPosition,
  BatteryListInfo,
  BatteryList,
  LensInfo,
  TemperatureInfo,
])
final Serializers dataSerializers = _$dataSerializers.toBuilder().build();
