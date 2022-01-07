import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'communication_setting.g.dart';

///
/// The level of the lanType on the camera.
///
class LanType extends EnumClass {
  /// The serializer for the AccessCapability enum
  static Serializer<LanType> get serializer => _$lanTypeSerializer;

  /// Low lanType level
  static const LanType ether = _$ether;

  /// Battery is half.
  static const LanType wft = _$wft;

  /// Battery is high.
  static const LanType wifi = _$wifi;

  const LanType._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<LanType> get values => _$LanTypeValues;

  /// The value from the string.
  static LanType valueOf(String name) => _$LanTypeValueOf(name);
}

///
/// The level of the connectionMethod on the camera.
///
class ConnectionMethod extends EnumClass {
  /// The serializer for the AccessCapability enum
  static Serializer<ConnectionMethod> get serializer =>
      _$connectionMethodSerializer;

  /// Infrastructure.
  static const ConnectionMethod infrastructure = _$infrastructure;

  /// Camera access point.
  static const ConnectionMethod cameraap = _$cameraap;

  const ConnectionMethod._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<ConnectionMethod> get values => _$ConnectionMethodValues;

  /// The value from the string.
  static ConnectionMethod valueOf(String name) =>
      _$ConnectionMethodValueOf(name);
}

///
/// The level of the connectionAuthentication on the camera.
///
class ConnectionAuthentication extends EnumClass {
  /// The serializer for the AccessCapability enum
  static Serializer<ConnectionAuthentication> get serializer =>
      _$connectionAuthenticationSerializer;

  /// open authentication.
  static const ConnectionAuthentication open = _$open;

  /// Shared key.
  static const ConnectionAuthentication sharedkey = _$sharedkey;

  /// wpa2.
  static const ConnectionAuthentication wpawpa2psk = _$wpawpa2psk;

  /// Camera access point.
  static const ConnectionAuthentication wpawpa2enterprise = _$wpawpa2enterprise;

  const ConnectionAuthentication._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<ConnectionAuthentication> get values =>
      _$ConnectionAuthenticationValues;

  /// The value from the string.
  static ConnectionAuthentication valueOf(String name) =>
      _$ConnectionAuthenticationValueOf(name);
}

///
/// The level of the connectionEncryption on the camera.
///
class ConnectionEncryption extends EnumClass {
  /// The serializer for the AccessCapability enum
  static Serializer<ConnectionEncryption> get serializer =>
      _$connectionEncryptionSerializer;

  /// none encryption.
  static const ConnectionEncryption none = _$none;

  /// wep encryption.
  static const ConnectionEncryption wep = _$wep;

  /// tkiepas encruotion.
  static const ConnectionEncryption tkiepas = _$tkiepas;

  /// aes encryption.
  static const ConnectionEncryption aes = _$aes;

  const ConnectionEncryption._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<ConnectionEncryption> get values =>
      _$ConnectionEncryptionValues;

  /// The value from the string.
  static ConnectionEncryption valueOf(String name) =>
      _$ConnectionEncryptionValueOf(name);
}

///
/// The level of the ipv4AddressSet on the camera.
///
class Ipv4AddressSet extends EnumClass {
  /// The serializer for the Ipv4AddressSet enum
  static Serializer<Ipv4AddressSet> get serializer =>
      _$ipv4AddressSetSerializer;

  /// none encryption.
  static const Ipv4AddressSet auto = _$auto;

  /// wep encryption.
  static const Ipv4AddressSet manual = _$manual;

  const Ipv4AddressSet._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<Ipv4AddressSet> get values => _$Ipv4AddressSetValues;

  /// The value from the string.
  static Ipv4AddressSet valueOf(String name) => _$Ipv4AddressSetValueOf(name);
}

///
/// EnableDisable the thing.
///
class EnableDisable extends EnumClass {
  /// The serializer for the EnableDisable enum
  static Serializer<EnableDisable> get serializer => _$enableDisableSerializer;

  /// enable the thing.
  static const EnableDisable enable = _$enable;

  /// disable the thing.
  @BuiltValueEnumConst(fallback: true)
  static const EnableDisable disable = _$disable;

  const EnableDisable._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<EnableDisable> get values => _$EnableDisableValues;

  /// The value from the string.
  static EnableDisable valueOf(String name) =>
       _$EnableDisableValueOf(name);
}

///
/// The communication setting stuff.
///
abstract class CommunicationSetting
    implements Built<CommunicationSetting, CommunicationSettingBuilder> {
  @BuiltValueField(wireName: 'lantype')
  LanType get lanType;

  String get ssid;

  ConnectionMethod get method;

  @BuiltValueField(wireName: 'channel')
  String get channelInternal;

  @memoized
  int get channel {
    var data = int.tryParse(keyIndexInternal);
    if (data == null) {
      return 0;
    }
    return data;
  }

  ConnectionAuthentication get authentication;

  ConnectionEncryption get encryption;

  @BuiltValueField(wireName: 'keyindex')
  String get keyIndexInternal;

  @memoized
  int get keyIndex {
    var data = int.tryParse(keyIndexInternal);
    if (data == null) {
      return 0;
    }
    return data;
  }

  String get password;

  @BuiltValueField(wireName: 'ipv4_ipaddressset')
  Ipv4AddressSet get ipv4IpAddressSet;

  @BuiltValueField(wireName: 'ipv4_ipaddress')
  InternetAddress get ipv4IpAddress;

  @BuiltValueField(wireName: 'ipv4_subnetmask')
  InternetAddress get ipv4SubnetMask;

  @BuiltValueField(wireName: 'ipv4_gateway')
  InternetAddress get ipv4Gateway;

  @BuiltValueField(wireName: 'ipv6_useipv6')
  EnableDisable get ipv6UseIpv6;

  @BuiltValueField(wireName: 'ipv6_manual_setting')
  EnableDisable get ipv6ManualSetting;

  @BuiltValueField(wireName: 'ipv6_manual_address')
  InternetAddress get ipv6ManualAddress;

  @BuiltValueField(wireName: 'ipv6_prefixlength')
  String get ipv6PrefixLength;

  @BuiltValueField(wireName: 'ipv6_gateway')
  InternetAddress get ipv6Gateway;

  /// Serializer for the CommunicationSetting.
  static Serializer<CommunicationSetting> get serializer =>
      _$communicationSettingSerializer;

  /// Private constructor for CommunicationSetting
  CommunicationSetting._();

  /// Create the CommunicationSetting class with a nifty factory.
  factory CommunicationSetting(
          [void Function(CommunicationSettingBuilder) updates]) =
      _$CommunicationSetting;

  /// Serialize the CommunicationSetting to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(CommunicationSetting.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the CommunicationSetting from a map.
  static CommunicationSetting fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
        CommunicationSetting.serializer, jsonData) as CommunicationSetting;
  }
}

///
/// All the communication settings!
///
abstract class AllCommunicationSettings
    implements
        Built<AllCommunicationSettings, AllCommunicationSettingsBuilder> {
  /// The communication settings by name.
  Map<String, CommunicationSetting> get settings;

  /// Serializer for the AllCommunicationSettings.
  static Serializer<AllCommunicationSettings> get serializer =>
      _$allCommunicationSettingsSerializer;

  /// Private constructor for AllCommunicationSettings
  AllCommunicationSettings._();

  /// Create the AllCommunicationSettings class with a nifty factory.
  factory AllCommunicationSettings(
          [void Function(AllCommunicationSettingsBuilder) updates]) =
      _$AllCommunicationSettings;

  /// Serialize the AllCommunicationSettings to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(
        AllCommunicationSettings.serializer, this) as Map<String, dynamic>;
  }

  /// Deserialize the AllCommunicationSettings from a map.
  static AllCommunicationSettings fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            AllCommunicationSettings.serializer, {'settings': jsonData})
        as AllCommunicationSettings;
  }
}
