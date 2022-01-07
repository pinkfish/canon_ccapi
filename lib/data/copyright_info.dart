library canon_ccapi;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'copyright_info.g.dart';

///
/// Information on the copyright stuff
///
abstract class CopyrightInfo
    implements Built<CopyrightInfo, CopyrightInfoBuilder> {
  /// Serializer for the copyright info.
  static Serializer<CopyrightInfo> get serializer => _$copyrightInfoSerializer;
  CopyrightInfo._();

  /// Create the camera info class with a nifty factory.
  factory CopyrightInfo([void Function(CopyrightInfoBuilder) updates]) =
      _$CopyrightInfo;

  /// Copyright owner on the camera
  String get copyright;

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

///
/// Information on the author stuff
///
abstract class AuthorInfo implements Built<AuthorInfo, AuthorInfoBuilder> {
  /// Serializer for the copyright info.
  static Serializer<AuthorInfo> get serializer => _$authorInfoSerializer;

  AuthorInfo._();

  /// Create the camera info class with a nifty factory.
  factory AuthorInfo([void Function(AuthorInfoBuilder) updates]) = _$AuthorInfo;

  /// Author on the camera
  String get author;

  /// Serialize the AuthorInfO to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(AuthorInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the AuthorInfO from a map.
  static AuthorInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(AuthorInfo.serializer, jsonData)
        as AuthorInfo;
  }
}
