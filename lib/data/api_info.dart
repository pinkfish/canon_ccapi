import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api.g.dart';

abstract class ApiInfo implements Built<ApiInfo, ApiInfoBuilder> {
  /// Serializer for the ApiInfo.
  static Serializer<ApiInfo> get serializer => _$ApiInfoSerializer;

  /// Private constructor for ApiInfo
  ApiInfo._();

  /// Create the ApiInfo class with a nifty factory.
  factory ApiInfo([void Function(ApiInfoBuilder) updates]) = _$ApiInfo;

  /// Serialize the ApiInfo to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(ApiInfo.serializer, this);
  }

  /// Deserialize the ApiInfo from a map.
  static ApiInfo fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(ApiInfo.serializer, jsonData);
  }


  String get url;

  @BuiltValue(wireName: 'get')
  bool get supportsGet;

  @BuiltValue(wireName: 'post')
  bool get supportsPost;
  @BuiltValue(wireName: 'delete')
  bool get supportsDelete;
  @BuiltValue(wireName: 'put')
  bool get supportsPut ;
}