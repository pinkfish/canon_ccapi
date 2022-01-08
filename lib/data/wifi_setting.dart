import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'communication_setting.dart';
import 'data_serializers.dart';

part 'wifi_setting.g.dart';

///
/// The class with all the details about the wifi connection.
///
abstract class WifiSetting implements Built<WifiSetting, WifiSettingBuilder> {
  /// The ssid of the wifi connection.
  String get ssid;

  /// The method to use to connect.
  WifiConnectionMethod get method;

  /// The channel the wifi connection is on/
  String get channel;

  /// How the connection is authenticated.
  ConnectionAuthentication get authentication;

  /// The type of encryption that is used.
  ConnectionEncryption get encryption;

  /// The key index of the setting
  String get keyindex;

  /// The password to use when connecting,
  String get password;

  /// How is the ip address set, dhcp or not.
  Ipv4AddressSet get ipaddressset;

  /// The ip address to use.
  InternetAddress get ipaddress;

  /// The subnet mask to use.
  InternetAddress get subnetmask;

  /// The gateway to use.
  InternetAddress get gateway;

  WifiSetting._();

  /// Factory to create WifiSetting
  factory WifiSetting([void Function(WifiSettingBuilder) updates]) =
      _$WifiSetting;

  /// Generate a map from WifiSetting
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(WifiSetting.serializer, this)
        as Map<String, dynamic>;
  }

  /// Create WifiSetting from the map.
  static WifiSetting fromMap(Map<String, dynamic> json) {
    return dataSerializers.deserializeWith(WifiSetting.serializer, json)
        as WifiSetting;
  }

  /// Serializer for WifiSetting
  static Serializer<WifiSetting> get serializer => _$wifiSettingSerializer;
}

///
/// The method the wifi uses to connect.
///
class WifiConnectionMethod extends EnumClass {
  static const WifiConnectionMethod infrastructure = _$infrastructure;
  static const WifiConnectionMethod cameraap = _$cameraap;

  const WifiConnectionMethod._(String name) : super(name);

  /// The values of the method.
  static BuiltSet<WifiConnectionMethod> get values =>
      _$wifiConnectionMethodValues;
  /// Get the value from the specific string.
  static WifiConnectionMethod valueOf(String name) =>
      _$wifiConnectionMethodValueOf(name);

  /// Serialize for the wire.
  String serialize() {
    return dataSerializers.serializeWith(WifiConnectionMethod.serializer, this) as String;
  }

  /// Deserialize from the wire.
  static WifiConnectionMethod deserialize(String string) {
    return dataSerializers.deserializeWith(
        WifiConnectionMethod.serializer, string) as WifiConnectionMethod;
  }

  /// The serializer to use.
  static Serializer<WifiConnectionMethod> get serializer =>
      _$wifiConnectionMethodSerializer;
}


///
/// All of the connection settings.
///
abstract class AllWifiSettings
    implements Built<AllWifiSettings, AllWifiSettingsBuilder> {
  /// All the connection settings by setting.
  BuiltMap<String, WifiSetting> get settings;

  /// Serializer for the AllWifiSettings.
  static Serializer<AllWifiSettings> get serializer =>
      _$allWifiSettingsSerializer;

  /// Private constructor for AllWifiSettings
  AllWifiSettings._();

  /// Create the AllWifiSettings class with a nifty factory.
  factory AllWifiSettings(
      [void Function(AllWifiSettingsBuilder) updates]) =
  _$AllWifiSettings;

  /// Serialize the AllWifiSettings to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(AllWifiSettings.serializer, this)
    as Map<String, dynamic>;
  }

  /// Deserialize the AllWifiSettings from a map.
  static AllWifiSettings fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
        AllWifiSettings.serializer, {'settings': jsonData})
    as AllWifiSettings;
  }
}
