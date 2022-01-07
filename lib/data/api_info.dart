import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'api_info.g.dart';

///
/// The information about the specific apis.
///
abstract class ApiInfo implements Built<ApiInfo, ApiInfoBuilder> {
  /// Serializer for the ApiInfo.
  static Serializer<ApiInfo> get serializer => _$apiInfoSerializer;

  /// Private constructor for ApiInfo
  ApiInfo._();

  /// Create the ApiInfo class with a nifty factory.
  factory ApiInfo([void Function(ApiInfoBuilder) updates]) = _$ApiInfo;

  /// Serialize the ApiInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(ApiInfo.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the ApiInfo from a map.
  static ApiInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(ApiInfo.serializer, jsonData)
        as ApiInfo;
  }

  @BuiltValueField(wireName: 'path')
  String get url;

  @BuiltValueField(wireName: 'get')
  bool get supportsGet;

  @BuiltValueField(wireName: 'post')
  bool get supportsPost;

  @BuiltValueField(wireName: 'delete')
  bool get supportsDelete;

  @BuiltValueField(wireName: 'put')
  bool get supportsPut;
}

///
/// The list of all the apis by version from the stream.
///
abstract class ApiList implements Built<ApiList, ApiListBuilder> {
  /// The apis by version.
  BuiltMap<String, BuiltList<ApiInfo>> get apis;

  /// Serializer for the ApiList.
  static Serializer<ApiList> get serializer => _$apiListSerializer;

  /// Private constructor for ApiList
  ApiList._();

  /// Create the ApiList class with a nifty factory.
  factory ApiList([void Function(ApiListBuilder) updates]) = _$ApiList;

  /// Return the versions for the specific urls
  @memoized
  BuiltMap<String, Set<String>> get appVersions {
    var apiUrls = MapBuilder<String, Set<String>>();
    for (var ver in apis.keys) {
      for (var api in apis[ver]!) {
        var bits = api.url.split('/');
        var apiExtra = bits.getRange(2, bits.length).join('/');
        apiUrls.putIfAbsent(apiExtra, () => <String>{});
        apiUrls[apiExtra]!.add(ver);
      }
    }
    return apiUrls.build();
  }

  /// Gets the url for the app given the version list.
  String getUrl(List<String> versions, String api) {
    if (appVersions.containsKey(api)) {
      for (var v in versions) {
        if (appVersions[api]!.contains(v)) {
          return "/ccapi/$v/$api";
        }
      }
      throw ArgumentError.value(versions, 'versions');
    }
    throw ArgumentError.value(api, 'api');
  }

  /// Serialize the ApiList to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(ApiList.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the ApiList from a map.
  static ApiList fromMap(Map<String, dynamic> jsonData) {
    // The data here is a normal map, we wrap it in the apis to make it conform
    // to the serialized format.
    return dataSerializers
        .deserializeWith(ApiList.serializer, {'apis': jsonData}) as ApiList;
  }
}
