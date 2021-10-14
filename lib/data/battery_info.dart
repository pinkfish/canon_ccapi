import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'battery_info.g.dart';

///
/// The level of the battery on the camer
///
class BatteryLevel extends EnumClass {
  /// The serializer for the AccessCapability enum
  static Serializer<BatteryLevel> get serializer => _$batteryLevelSerializer;

  /// Low battery level
  static const BatteryLevel low = _$low;

  /// Battery is half.
  static const BatteryLevel half = _$half;

  /// Battery is high.
  static const BatteryLevel high = _$high;

  /// Battery is full.
  static const BatteryLevel full = _$full;

  /// Battery is unknown.
  static const BatteryLevel unknown = _$unknownLevel;

  /// Battery is charging.
  static const BatteryLevel charge = _$charge;

  /// Battery is charging has stopped.
  static const BatteryLevel chargestop = _$chargestop;

  /// Battery is charging is completed.
  static const BatteryLevel chargecomp = _$chargecomp;

  const BatteryLevel._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<BatteryLevel> get values => _$BatteryLevelValues;

  /// The value from the string.
  static BatteryLevel valueOf(String name) => _$BatteryLevelValueOf(name);
}

///
/// The quality of the battery on the camera.
///
class BatteryQuality extends EnumClass {
  /// The serializer for the BatteryQuality enum
  static Serializer<BatteryQuality> get serializer =>
      _$batteryQualitySerializer;

  /// Battery is not degraded at all.
  static const BatteryQuality good = _$good;

  /// Battery is degraded a bit, normal state.
  static const BatteryQuality normal = _$normal;

  /// Battery is degraded quite a bit.
  static const BatteryQuality bad = _$bad;

  /// Unknown how much degration happened.
  static const BatteryQuality unknown = _$unknownQuality;

  const BatteryQuality._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<BatteryQuality> get values => _$BatteryQualityValues;

  /// The value from the string.
  static BatteryQuality valueOf(String name) => _$BatteryQualityValueOf(name);
}

///
/// The Position of the battery on the camera.
///
class BatteryPosition extends EnumClass {
  /// The serializer for the BatteryPosition enum
  static Serializer<BatteryPosition> get serializer =>
      _$batteryPositionSerializer;

  /// The battery is in the camera.
  static const BatteryPosition camera = _$camera;

  /// The battery is in the grip.
  static const BatteryPosition grip01 = _$grip01;

  /// The battery is in the grip.
  static const BatteryPosition grip02 = _$grip02;

  const BatteryPosition._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<BatteryPosition> get values => _$BatteryPositionValues;

  /// The value from the string.
  static BatteryPosition valueOf(String name) => _$BatteryPositionValueOf(name);
}

///
/// The Kind of the battery on the camera.
///
class BatteryKind extends EnumClass {
  /// The serializer for the BatteryKind enum
  static Serializer<BatteryKind> get serializer => _$batteryKindSerializer;

  /// Running on a battery.
  static const BatteryKind battery = _$battery;

  /// No battery is inserted.
  static const BatteryKind not_inserted = _$not_inserted;

  /// Battery is plugged into the ac adapter..
  static const BatteryKind ac_adapter = _$ac_adapter;

  /// Camera is plugged into the dc adapter.
  static const BatteryKind dc_adapter = _$dc_adapter;

  /// Battery is a grip.
  static const BatteryKind battery_grip = _$battery_grip;

  /// Unknown kind of battery.
  static const BatteryKind unknown = _$unknownKind;

  const BatteryKind._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<BatteryKind> get values => _$BatteryKindValues;

  /// The value from the string.
  static BatteryKind valueOf(String name) => _$BatteryKindValueOf(name);
}

///
/// The information about the battery.
///
abstract class BatteryInfo implements Built<BatteryInfo, BatteryInfoBuilder> {
  /// name of the battery.
  String get name;

  /// The type of battery used.
  BatteryKind get kind;

  /// The level of the battery
  BatteryLevel get level;

  /// The quality of the battery.
  String get quality;

  /// Serializer for the BatteryInfo.
  static Serializer<BatteryInfo> get serializer => _$batteryInfoSerializer;

  /// Private constructor for BatteryInfo
  BatteryInfo._();

  /// Create the BatteryInfo class with a nifty factory.
  factory BatteryInfo([void Function(BatteryInfoBuilder) updates]) =
      _$BatteryInfo;

  /// Serialize the BatteryInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(BatteryInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the BatteryInfo from a map.
  static BatteryInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(BatteryInfo.serializer, jsonData)
        as BatteryInfo;
  }
}

///
/// The battery information used in the list format.
///
abstract class BatteryListInfo
    implements Built<BatteryListInfo, BatteryListInfoBuilder> {
  /// The position of the battery.
  BatteryPosition get position;

  /// The name of the battery
  String get name;

  /// The kind of the battery
  BatteryKind get kind;

  /// The level of the battery
  @BuiltValueField(wireName: 'level')
  String get innerLevel;

  /// If the level is unknown.
  @memoized
  bool get levelUnknown => innerLevel == 'unknown';

  /// The level of the battery, -1 on error.
  @memoized
  int get level => int.tryParse(innerLevel) ?? -1;

  /// The quality of the battery.
  BatteryQuality get quality;

  /// Serializer for the BatteryListInfo.
  static Serializer<BatteryListInfo> get serializer =>
      _$batteryListInfoSerializer;

  /// Private constructor for BatteryListInfo
  BatteryListInfo._();

  /// Create the BatteryListInfo class with a nifty factory.
  factory BatteryListInfo([void Function(BatteryListInfoBuilder) updates]) =
      _$BatteryListInfo;

  /// Serialize the BatteryListInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(BatteryListInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the BatteryListInfo from a map.
  static BatteryListInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(BatteryListInfo.serializer, jsonData)
        as BatteryListInfo;
  }
}

///
/// The list of batteries in the camera.
///
abstract class BatteryList implements Built<BatteryList, BatteryListBuilder> {
  /// THe list of batteries.
  @BuiltValue(wireName: 'batterylist')
  BuiltList<BatteryListInfo> get batteryList;

  /// Serializer for the BatteryList.
  static Serializer<BatteryList> get serializer => _$batteryListSerializer;

  /// Private constructor for BatteryList
  BatteryList._();

  /// Create the BatteryList class with a nifty factory.
  factory BatteryList([void Function(BatteryListBuilder) updates]) =
      _$BatteryList;

  /// Serialize the BatteryList to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(BatteryList.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the BatteryList from a map.
  static BatteryList fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(BatteryList.serializer, jsonData)
        as BatteryList;
  }
}
