import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'communication_setting.dart';
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

  /// Name of the storage.
  String get name;

  /// The url used in v1.0 of the storage to identify the location.
  String? get url;

  /// The path used in v1.1 of the api to identify the location.
  String? get path;

  /// What type of accessibility the storage has.
  @BuiltValueField(wireName: 'accesscapability')
  AccessCapability get accessCapability;

  /// Maximum amount of space.
  int get maxsize;

  /// How much space is left.
  @BuiltValueField(wireName: 'spacesize')
  int get spaceSize;

  /// How many items in the contents.
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
abstract class StorageDestinationInfo
    implements Built<StorageDestinationInfo, StorageDestinationInfoBuilder> {
  /// The name of the storage location.
  String get name;

  /// The path the storage location uses on the camera.
  String get path;

  /// Serializer for the StorageDestinationInfo.
  static Serializer<StorageDestinationInfo> get serializer =>
      _$storageDestinationInfoSerializer;

  /// Private constructor for StorageDestinationInfo
  StorageDestinationInfo._();

  /// Create the StorageDestinationInfo class with a nifty factory.
  factory StorageDestinationInfo(
          [void Function(StorageDestinationInfoBuilder) updates]) =
      _$StorageDestinationInfo;

  /// Serialize the StorageDestinationInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(
        StorageDestinationInfo.serializer, this) as Map<String, dynamic>;
  }

  /// Deserialize the StorageDestinationInfo from a map.
  static StorageDestinationInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
        StorageDestinationInfo.serializer, jsonData) as StorageDestinationInfo;
  }
}

///
/// The list of storage destinations to use for recording.
///
abstract class StorageDestinationList
    implements Built<StorageDestinationList, StorageDestinationListBuilder> {
  /// The list of destinations
  BuiltList<StorageDestinationInfo> get storage;

  /// Serializer for the StorageDestinationList.
  static Serializer<StorageDestinationList> get serializer =>
      _$storageDestinationListSerializer;

  /// Private constructor for StorageDestinationList
  StorageDestinationList._();

  /// Create the StorageDestinationList class with a nifty factory.
  factory StorageDestinationList(
          [void Function(StorageDestinationListBuilder) updates]) =
      _$StorageDestinationList;

  /// Serialize the StorageDestinationList to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(
        StorageDestinationList.serializer, this) as Map<String, dynamic>;
  }

  /// Deserialize the StorageDestinationList from a map.
  static StorageDestinationList fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
        StorageDestinationList.serializer, jsonData) as StorageDestinationList;
  }
}

///
/// The location of the storage stuff on the current camera.
///
abstract class StorageLocations
    implements Built<StorageLocations, StorageLocationsBuilder> {
  /// The v1.0 version of the location.
  BuiltList<String> get urls;

  /// The v1.1 version of the location.
  BuiltList<String> get paths;

  StorageLocations._();

  /// Factory to create StorageLocations
  factory StorageLocations([void Function(StorageLocationsBuilder) updates]) =
      _$StorageLocations;

  /// Generate a map from StorageLocations
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(StorageLocations.serializer, this)
        as Map<String, dynamic>;
  }

  /// Create StorageLocations from the map.
  static StorageLocations fromMap(Map<String, dynamic> json) {
    return dataSerializers.deserializeWith(StorageLocations.serializer, json)
        as StorageLocations;
  }

  /// Serializer for StorageLocations
  static Serializer<StorageLocations> get serializer =>
      _$storageLocationsSerializer;
}

///
/// The storage content type to get.
///
class StorageContentType extends EnumClass {
  static const StorageContentType all = _$all;
  static const StorageContentType jpeg = _$jpeg;
  static const StorageContentType cr2 = _$cr2;
  static const StorageContentType cr3 = _$cr3;
  static const StorageContentType wav = _$wav;
  static const StorageContentType mp4 = _$mp4;
  static const StorageContentType mov = _$mov;
  // v1.1
  static const StorageContentType hif = _$hif;
  static const StorageContentType crm = _$crm;

  const StorageContentType._(String name) : super(name);

  /// The values for StorageContentType
  static BuiltSet<StorageContentType> get values => _$storageContentTypeValues;

  /// Get the value of  from string/
  static StorageContentType valueOf(String name) =>
      _$storageContentTypeValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(StorageContentType.serializer, this)
        as String;
  }

  /// Deserialize
  static StorageContentType deserialize(String string) {
    return dataSerializers.deserializeWith(
        StorageContentType.serializer, string) as StorageContentType;
  }

  /// Get the serializer for
  static Serializer<StorageContentType> get serializer =>
      _$storageContentTypeSerializer;
}

///
/// The kind of request to do.
///
class StorageContentKind extends EnumClass {
  static const StorageContentKind list = _$list;
  static const StorageContentKind chunked = _$chunked;
  static const StorageContentKind number = _$number;

  const StorageContentKind._(String name) : super(name);

  /// The values for StorageContentKind
  static BuiltSet<StorageContentKind> get values => _$storageContentKindValues;

  /// Get the value of  from string/
  static StorageContentKind valueOf(String name) =>
      _$storageContentKindValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(StorageContentKind.serializer, this)
        as String;
  }

  /// Deserialize
  static StorageContentKind deserialize(String string) {
    return dataSerializers.deserializeWith(
        StorageContentKind.serializer, string) as StorageContentKind;
  }

  /// Get the serializer for
  static Serializer<StorageContentKind> get serializer =>
      _$storageContentKindSerializer;
}

///
/// The type of data to request for a specific file.
///
class StorageContentRequestType extends EnumClass {
  static const StorageContentRequestType main = _$main;
  static const StorageContentRequestType thumbnail = _$thumbnail;
  static const StorageContentRequestType display = _$display;
  static const StorageContentRequestType embedded = _$embedded;
  static const StorageContentRequestType info = _$info;

  const StorageContentRequestType._(String name) : super(name);

  /// The values for StorageContentRequestType
  static BuiltSet<StorageContentRequestType> get values =>
      _$storageContentRequestTypeValues;

  /// Get the value of  from string/
  static StorageContentRequestType valueOf(String name) =>
      _$storageContentRequestTypeValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(
        StorageContentRequestType.serializer, this) as String;
  }

  /// Deserialize
  static StorageContentRequestType deserialize(String string) {
    return dataSerializers.deserializeWith(
            StorageContentRequestType.serializer, string)
        as StorageContentRequestType;
  }

  /// Get the serializer for
  static Serializer<StorageContentRequestType> get serializer =>
      _$storageContentRequestTypeSerializer;
}

///
/// The information about the storage items on the camera.
///
abstract class StorageContentInfo
    implements Built<StorageContentInfo, StorageContentInfoBuilder> {
  @BuiltValueField(wireName: 'filesize')
  int get fileSize;
  EnableDisable get protect;
  EnableDisable get archive;
  int get rotate;
  String get rating;
  @BuiltValueField(wireName: 'lastmodifieddate')
  String get lastModifiedDateString;
  int? get playtime;
  String? get hdr;
  @memoized
  DateTime get lastModifiedData => HttpDate.parse(lastModifiedDateString);


  StorageContentInfo._();

  /// Factory to create StorageContentInfo
  factory StorageContentInfo(
          [void Function(StorageContentInfoBuilder) updates]) =
      _$StorageContentInfo;

  /// Generate a map from StorageContentInfo
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(StorageContentInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Create StorageContentInfo from the map.
  static StorageContentInfo fromMap(Map<String, dynamic> json) {
    return dataSerializers.deserializeWith(StorageContentInfo.serializer, json)
        as StorageContentInfo;
  }

  /// Serializer for StorageContentInfo
  static Serializer<StorageContentInfo> get serializer =>
      _$storageContentInfoSerializer;
}
