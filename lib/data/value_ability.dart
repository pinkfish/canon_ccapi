import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'data_serializers.dart';

part 'value_ability.g.dart';

///
/// Value/Ability style of class.
///
abstract class ValueAbility
    implements Built<ValueAbility, ValueAbilityBuilder> {
  /// The current value of the thingy.
  String get value;

  /// The list of abilities for this thingy.
  BuiltList<String> get ability;

  /// Serializer for the ValueAbility.
  static Serializer<ValueAbility> get serializer => _$valueAbilitySerializer;

  /// Private constructor for ValueAbility
  ValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory ValueAbility([void Function(ValueAbilityBuilder) updates]) =
      _$ValueAbility;

  /// Serialize the ValueAbility to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(ValueAbility.serializer, this)
        as Map<String, dynamic>;
  }

  /// Deserialize the ValueAbility from a map.
  static ValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(ValueAbility.serializer, jsonData)
        as ValueAbility;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void checkResult(ValueAbilityBuilder b) {
    assert(b.ability.build().contains(b.value));
  }

  ///
  /// Creates the beep value ability type.
  ///
  static ValueAbility createBeep(String value) {
    return ValueAbility((b) => b
      ..ability = ListBuilder(["enable", "disable", "disabletouch"])
      ..value = value);
  }

  ///
  /// How long before the display should auto power off.
  ///
  static ValueAbility createAutoDisplayOff(String value) {
    return ValueAbility((b) => b
      ..ability = ListBuilder(["10", "20", "30", "60", "120", "180"])
      ..value = value);
  }

  ///
  /// How long before the display should auto power off.
  ///
  static ValueAbility createAutoPowerOff(String value) {
    return ValueAbility((b) => b
      ..ability =ListBuilder( ["30", "60", "180", "300", "600", "disable", "immediately"])
      ..value = value);
  }



}
