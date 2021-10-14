import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import'data_serializers.dart';

part 'lens_info.g.dart';

///
/// Information about the lens.
abstract class LensInfo implements Built<LensInfo, LensInfoBuilder> {
  /// The name of the lens
  String get name;
  /// If the lens is currently mounted.
  bool get mount;

  /// Serializer for the LensInfo.
  static Serializer<LensInfo> get serializer => _$lensInfoSerializer;

  /// Private constructor for LensInfo
  LensInfo._();

  /// Create the LensInfo class with a nifty factory.
  factory LensInfo([void Function(LensInfoBuilder) updates]) = _$LensInfo;

  /// Serialize the LensInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(LensInfo.serializer, this) as Map<String, dynamic>;
  }

  /// Deserialize the LensInfo from a map.
  static LensInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(LensInfo.serializer, jsonData) as LensInfo;
  }
}