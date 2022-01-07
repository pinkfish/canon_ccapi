import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'connection_setting.g.dart';

///
/// The connection setting.
///
abstract class ConnectionSetting
    implements Built<ConnectionSetting, ConnectionSettingBuilder> {
  ///
  /// The exciting comm setting array.
  ///
  @BuiltValueField(wireName: 'commsetting')
  BuiltList<String> get commSetting;

  ///
  /// The super thrilling function setting array.
  ///
  @BuiltValueField(wireName: 'functionsetting')
  BuiltList<String> get functionSetting;

  /// Serializer for the ConnectionSetting.
  static Serializer<ConnectionSetting> get serializer =>
      _$connectionSettingSerializer;

  /// Private constructor for ConnectionSetting
  ConnectionSetting._();

  /// Create the ConnectionSetting class with a nifty factory.
  factory ConnectionSetting([void Function(ConnectionSettingBuilder) updates]) =
      _$ConnectionSetting;

  /// Serialize the ConnectionSetting to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(ConnectionSetting.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the ConnectionSetting from a map.
  static ConnectionSetting fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
        ConnectionSetting.serializer, jsonData) as ConnectionSetting;
  }
}

///
/// All of the connection settings.
///
abstract class AllConnectionSettings
    implements Built<AllConnectionSettings, AllConnectionSettingsBuilder> {
  /// All the connection settings by setting.
  BuiltMap<String, ConnectionSetting> get settings;

  /// Serializer for the AllConnectionSettings.
  static Serializer<AllConnectionSettings> get serializer =>
      _$allConnectionSettingsSerializer;

  /// Private constructor for AllConnectionSettings
  AllConnectionSettings._();

  /// Create the AllConnectionSettings class with a nifty factory.
  factory AllConnectionSettings(
          [void Function(AllConnectionSettingsBuilder) updates]) =
      _$AllConnectionSettings;

  /// Serialize the AllConnectionSettings to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(AllConnectionSettings.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the AllConnectionSettings from a map.
  static AllConnectionSettings fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            AllConnectionSettings.serializer, {'settings': jsonData})
        as AllConnectionSettings;
  }
}
