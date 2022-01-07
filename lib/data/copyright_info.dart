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



///
/// Information on the author stuff
///
abstract class OwnerNameInfo implements Built<OwnerNameInfo, OwnerNameInfoBuilder> {
  /// Serializer for the copyright info.
  static Serializer<OwnerNameInfo> get serializer => _$ownerNameInfoSerializer;
  OwnerNameInfo._();

  /// Create the camera info class with a nifty factory.
  factory OwnerNameInfo([void Function(OwnerNameInfoBuilder)? updates]) = _$OwnerNameInfo;

  /// Author on the camera
  String get author;

  /// Serialize the AuthorInfO to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(OwnerNameInfo.serializer, this)
    as Map<String, dynamic>;
  }

  /// Deserialize the AuthorInfO from a map.
  static OwnerNameInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(OwnerNameInfo.serializer, jsonData)
    as AuthorInfo;
  }
}


///
/// Information on the author stuff
///
abstract class NicknameInfo implements Built<NicknameInfo, NicknameInfoBuilder> {
  /// Serializer for the copyright info.
  static Serializer<NicknameInfo> get serializer => _$nicknameInfoSerializer;

  NicknameInfo._();

  /// Create the camera info class with a nifty factory.
  factory NicknameInfo([void Function(NicknameInfoBuilder) updates]) = _$NicknameInfo;

  /// Author on the camera
  String get author;

  /// Serialize the AuthorInfO to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(NicknameInfo.serializer, this)
    as Map<String, dynamic>;
  }

  /// Deserialize the AuthorInfO from a map.
  static NicknameInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(NicknameInfo.serializer, jsonData)
    as NicknameInfo;
  }
}


