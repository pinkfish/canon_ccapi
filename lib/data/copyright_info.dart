import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'copyright_info.g.dart';

abstract class CopyrightInfo
    implements Built<CopyrightInfo, CopyrightInfoBuilder> {
  /// The copyright holder name for the camera.
  String get copyright;

  /// Serializer for the CopyrightInfo.
  static Serializer<CopyrightInfo> get serializer => _$copyrightInfoSerializer;

  /// Private constructor for CopyrightInfo
  CopyrightInfo._();

  /// Create the CopyrightInfo class with a nifty factory.
  factory CopyrightInfo([void Function(CopyrightInfoBuilder) updates]) =
      _$CopyrightInfo;

  /// Serialize the CopyrightInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(CopyrightInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the CopyrightInfo from a map.
  static CopyrightInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(CopyrightInfo.serializer, jsonData)
        as CopyrightInfo;
  }
}
