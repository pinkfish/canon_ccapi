import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'temperature_info.g.dart';

///
/// The access capabilities of the storage points on the camera.
///
class TemperatureStatus extends EnumClass {
  /// The serializer for the TemperatureStatus enum
  static Serializer<TemperatureStatus> get serializer =>
      _$temperatureStatusSerializer;

  /// Normal status
  static const TemperatureStatus normal = _$normal;

  /// Warning indication status
  static const TemperatureStatus warning = _$warning;

  /// Reduced frame rate
  static const TemperatureStatus frameratedown = _$frameratedown;

  /// Live View prohibited status
  static const TemperatureStatus disableliveview = _$disableliveview;

  /// Shooting prohibited status
  static const TemperatureStatus disablerelease = _$disablerelease;

  /// Degraded still image quality warning
  static const TemperatureStatus stillqualitywarning = _$stillqualitywarning;

  /// Restriction movie recording status
  static const TemperatureStatus restrictionmovierecording =
      _$restrictionmovierecording;

  /// Warning indication and restriction movie recording status
  static const TemperatureStatus warning_and_restrictionmovierecording =
      _$warning_and_restrictionmovierecording;

  /// Reduced frame rate and restriction movie recording status
  static const TemperatureStatus frameratedown_and_restrictionmovierecording =
      _$frameratedown_and_restrictionmovierecording;

  ///  Live View prohibited and restriction movie recording status
  static const TemperatureStatus disableliveview_and_restrictionmovierecording =
      _$disableliveview_and_restrictionmovierecording;

  /// Shooting prohibited and restriction movie recording status
  static const TemperatureStatus disablerelease_and_restrictionmovierecording =
      _$disablerelease_and_restrictionmovierecording;

  /// Degraded still image quality warning and restriction movie recording status
  static const TemperatureStatus
      stillqualitywarning_and_restrictionmovierecording =
      _$stillqualitywarning_and_restrictionmovierecording;

  const TemperatureStatus._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<TemperatureStatus> get values => _$TemperatureStatusValues;

  /// The value from the string.
  static TemperatureStatus valueOf(String name) =>
      _$TemperatureStatusValueOf(name);
}

///
/// The temperature status of the camera.
///
abstract class TemperatureInfo
    implements Built<TemperatureInfo, TemperatureInfoBuilder> {
  /// The current status of the temperature.
  TemperatureStatus get status;

  /// Serializer for the TemperatureInfo.
  static Serializer<TemperatureInfo> get serializer =>
      _$temperatureInfoSerializer;

  /// Private constructor for TemperatureInfo
  TemperatureInfo._();

  /// Create the TemperatureInfo class with a nifty factory.
  factory TemperatureInfo([void Function(TemperatureInfoBuilder) updates]) =
      _$TemperatureInfo;

  /// Serialize the TemperatureInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(TemperatureInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the TemperatureInfo from a map.
  static TemperatureInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(TemperatureInfo.serializer, jsonData)
        as TemperatureInfo;
  }
}
