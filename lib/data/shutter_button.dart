import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'shutter_button.g.dart';

///
/// The class to control the shutter button.
///
class ShutterButton extends EnumClass {
  static const ShutterButton fullPress = _$fullPress;
  static const ShutterButton halfPress = _$halfPress;
  static const ShutterButton release = _$release;

  const ShutterButton._(String name) : super(name);

  /// The values for ShutterButton
  static BuiltSet<ShutterButton> get values => _$shutterButtonValues;

  /// Get the value of  from string/
  static ShutterButton valueOf(String name) => _$shutterButtonValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(ShutterButton.serializer, this)
        as String;
  }

  /// Deserialize
  static ShutterButton deserialize(String string) {
    return dataSerializers.deserializeWith(ShutterButton.serializer, string)
        as ShutterButton;
  }

  /// Get the serializer for
  static Serializer<ShutterButton> get serializer => _$shutterButtonSerializer;
}
