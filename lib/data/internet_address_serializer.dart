import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';


/// Serializer for [InternetAddress].
///
/// An exception will be thrown on attempt to serialize local DateTime
/// instances; you must use UTC.
class InternetAddressSerializer implements PrimitiveSerializer<InternetAddress> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([InternetAddress]);
  @override
  final String wireName = 'Timestamp';

  @override
  Object serialize(Serializers serializers, InternetAddress ipAddress,
      {FullType specifiedType = FullType.unspecified}) {
    print('Serializer $ipAddress');
    return ipAddress.address;
  }

  @override
  InternetAddress deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    print('Deserialize $serialized');
    if ((serialized as String).isEmpty) {
      return InternetAddress('0.0.0.0');
    }
    var addr = InternetAddress.tryParse(serialized as String);
    if (addr != null) {
      return addr;
    }

    throw  FormatException('Invalid format of ip address $serialized');
  }
}