import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'storage_info.g.dart';

///
/// The access capabilities of the storage points on the camera.
///
class AccessCapability extends EnumClass {
  /// The serializer for the AccessCapability enum
  static Serializer<AccessCapability> get serializer =>
      _$accessCapabilitySerializer;

  /// Readonly device.
  static const AccessCapability readonly = _$readonly;

  /// Readwrite device.
  static const AccessCapability readwrite = _$readwrite;

  const AccessCapability._(String name) : super(name);

  /// The values of the enum.
  static BuiltSet<AccessCapability> get values => _$AccessCapabilityValues;

  /// The value from the string.
  static AccessCapability valueOf(String name) =>
      _$AccessCapabilityValueOf(name);
}

///
/// Information about the storage devices connected to the canon camera.
///
abstract class StorageInfo implements Built<StorageInfo, StorageInfoBuilder> {
  /// Serializer for the StorageInfo.
  static Serializer<StorageInfo> get serializer => _$storageInfoSerializer;

  /// Private constructor for StorageInfo
  StorageInfo._();

  /// Create the StorageInfo class with a nifty factory.
  factory StorageInfo([void Function(StorageInfoBuilder) updates]) =
      _$StorageInfo;

  /// Serialize the StorageInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(StorageInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the StorageInfo from a map.
  static StorageInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(StorageInfo.serializer, jsonData)
        as StorageInfo;
  }

  String get name;

  String? get url;

  String? get path;

  @BuiltValueField(wireName: 'accesscapability')
  AccessCapability get accessCapability;

  int get maxsize;

  @BuiltValueField(wireName: 'spacesize')
  int get spaceSize;

  @BuiltValueField(wireName: 'contentsnumber')
  int get contentsNumber;
}

///
/// The list of all the storage devices connected to the canon camera.
///
abstract class StorageInfoList
    implements Built<StorageInfoList, StorageInfoListBuilder> {
  /// The list of storage types.
  @BuiltValueField(wireName: 'storagelist')
  BuiltList<StorageInfo> get storageList;

  /// Serializer for the StorageInfoList.
  static Serializer<StorageInfoList> get serializer =>
      _$storageInfoListSerializer;

  /// Private constructor for StorageInfoList
  StorageInfoList._();

  /// Create the StorageInfoList class with a nifty factory.
  factory StorageInfoList([void Function(StorageInfoListBuilder) updates]) =
      _$StorageInfoList;

  /// Serialize the StorageInfoList to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(StorageInfoList.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the StorageInfoList from a map.
  static StorageInfoList fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(StorageInfoList.serializer, jsonData)
        as StorageInfoList;
  }
}

///
/// Simpler details about the storage to use as a destination for recording.
///
abstract class StorageDestinationInfo implements Built<StorageDestinationInfo, StorageDestinationInfoBuilder> {
  /// The name of the storage location.
  String get name;

  /// The path the storage location uses on the camera.
  String get path;
  
  /// Serializer for the StorageDestinationInfo.
  static Serializer<StorageDestinationInfo> get serializer => _$storageDestinationInfoSerializer;

  /// Private constructor for StorageDestinationInfo
  StorageDestinationInfo._();
  
  /// Create the StorageDestinationInfo class with a nifty factory.
  factory StorageDestinationInfo([void Function(StorageDestinationInfoBuilder) updates]) = _$StorageDestinationInfo;
  
  /// Serialize the StorageDestinationInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(StorageDestinationInfo.serializer, this) as Map<String, dynamic>;
  }

  /// Deserialize the StorageDestinationInfo from a map.
  static StorageDestinationInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(StorageDestinationInfo.serializer, jsonData) as StorageDestinationInfo;
  }
}

///
/// The list of storage destinations to use for recording.
///
abstract class StorageDestinationList implements Built<StorageDestinationList, StorageDestinationListBuilder> {
  /// The list of destinations
  BuiltList<StorageDestinationInfo> get storage;

  /// Serializer for the StorageDestinationList.
  static Serializer<StorageDestinationList> get serializer => _$storageDestinationListSerializer;

  /// Private constructor for StorageDestinationList
  StorageDestinationList._();

  /// Create the StorageDestinationList class with a nifty factory.
  factory StorageDestinationList([void Function(StorageDestinationListBuilder) updates]) = _$StorageDestinationList;

  /// Serialize the StorageDestinationList to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(StorageDestinationList.serializer, this) as Map<String, dynamic>;
  }

  /// Deserialize the StorageDestinationList from a map.
  static StorageDestinationList fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(StorageDestinationList.serializer, jsonData) as StorageDestinationList;
  }
}
