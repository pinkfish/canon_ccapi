import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:canon_ccapi/data/communication_setting.dart';
import 'package:canon_ccapi/data/shutter_button.dart';
import 'package:canon_ccapi/data/value_ability.dart';
import 'package:canon_ccapi/data/wifi_setting.dart';

import 'api_info.dart';
import 'battery_info.dart';
import 'camera_info.dart';
import 'connection_setting.dart';
import 'internet_address_serializer.dart';
import 'lens_info.dart';
import 'network_function_modes.dart';
import 'storage_info.dart';
import 'temperature_info.dart';
import 'value_ability.dart';

part 'data_serializers.g.dart';

///
/// Collection of generated serializers for the built_value chat example.
///
@SerializersFor([
  AccessCapability,
  AllCommunicationSettings,
  AllConnectionSettings,
  AllNetworkFunctionModes,
  AutoDisplayOff,
  AutoPowerOff,
  AutoDisplayOffValueAbility,
  AutoPowerOffValueAbility,
  ApiInfo,
  ApiList,
  BatteryInfo,
  BatteryInfo,
  BatteryKind,
  BatteryLevel,
  BatteryList,
  BatteryListInfo,
  BatteryPosition,
  BeepEnableDisable,
  BeepEnableDisableValueAbility,
  CameraInfo,
  CommunicationSetting,
  ConnectionAuthentication,
  ConnectionEncryption,
  ConnectionMethod,
  ConnectionSetting,
  EnableDisable,
  EnableDisableValueAbility,
  Ipv4AddressSet,
  Ipv4AddressSet,
  LanType,
  LensInfo,
  NetworkFunctionMode,
  Ipv4AddressSet,
  ShutterButton,
  StillImageRecord,
  StillImageRecordValueAbility,
  StorageContentInfo,
  StorageInfo,
  StorageInfoList,
  StorageLocations,
  TemperatureInfo,
  WifiSetting,
])
final Serializers dataSerializers = (_$dataSerializers.toBuilder()
      ..add(InternetAddressSerializer())
      ..addBuilderFactory(
          // add this builder factory
          const FullType(BuiltList, [FullType(ApiInfo)]),
          () => ListBuilder<ApiInfo>())
      ..addPlugin(StandardJsonPlugin()))
    .build();
