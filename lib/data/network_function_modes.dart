import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'network_function_modes.g.dart';

///
/// The network function mode stuff.
///
abstract class NetworkFunctionMode
    implements Built<NetworkFunctionMode, NetworkFunctionModeBuilder> {
  @BuiltValueField(wireName: 'commfunction')
  String get communicationFunction;

  NetworkFunctionMode._();

  /// Factory to create NetworkFunctionMode
  factory NetworkFunctionMode(
          [void Function(NetworkFunctionModeBuilder) updates]) =
      _$NetworkFunctionMode;

  /// Generate a map from NetworkFunctionMode
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(NetworkFunctionMode.serializer, this)
        as Map<String, dynamic>;
  }

  /// Create NetworkFunctionMode from the map.
  static NetworkFunctionMode fromMap(Map<String, dynamic> json) {
    return dataSerializers.deserializeWith(NetworkFunctionMode.serializer, json)
        as NetworkFunctionMode;
  }

  /// Serializer for NetworkFunctionMode
  static Serializer<NetworkFunctionMode> get serializer =>
      _$networkFunctionModeSerializer;
}

///
/// All the network function settings modes.
///
abstract class AllNetworkFunctionModes
    implements Built<AllNetworkFunctionModes, AllNetworkFunctionModesBuilder> {
  /// The set of function nodes for this camera.
  BuiltMap<String, NetworkFunctionMode> get modes;

  AllNetworkFunctionModes._();

  /// Factory to create AllNetworkFunctionModes
  factory AllNetworkFunctionModes(
          [void Function(AllNetworkFunctionModesBuilder) updates]) =
      _$AllNetworkFunctionModes;

  /// Generate a map from AllNetworkFunctionModes
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(
        AllNetworkFunctionModes.serializer, this) as Map<String, dynamic>;
  }

  /// Create AllNetworkFunctionModes from the map.
  static AllNetworkFunctionModes fromMap(Map<String, dynamic> json) {
    return dataSerializers.deserializeWith(
            AllNetworkFunctionModes.serializer, {'modes': json})
        as AllNetworkFunctionModes;
  }

  /// Serializer for AllNetworkFunctionModes
  static Serializer<AllNetworkFunctionModes> get serializer =>
      _$allNetworkFunctionModesSerializer;
}
