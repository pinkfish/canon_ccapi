import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:canon_ccapi/data/communication_setting.dart';

import 'data_serializers.dart';

part 'value_ability.g.dart';

///
/// The base class to use for doing value ability stuff.
///
mixin ValueAbilityBase<T extends EnumClass> {
  /// Gets the value of the ability
  T get value;

  /// Gets the lists of abilities for this camera.
  BuiltList<T> get ability;

  @memoized
  Serializer get mySerializer;

  /// Serialize the ValueAbility to a map.
  Map<String, dynamic> toMap() {
    return dataSerializers.serializeWith(mySerializer, this)
        as Map<String, dynamic>;
  }
}

///
/// Where to record the images/movies too.
///
class RecordLocation extends EnumClass {
  static const RecordLocation none = _$none;
  static const RecordLocation card1 = _$card1;
  static const RecordLocation card2 = _$card2;

  const RecordLocation._(String name) : super(name);

  /// The values for RecordLocation
  static BuiltSet<RecordLocation> get values => _$recordLocationValues;

  /// Get the value of  from string/
  static RecordLocation valueOf(String name) => _$recordLocationValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(RecordLocation.serializer, this)
        as String;
  }

  /// Deserialize
  static RecordLocation deserialize(String string) {
    return dataSerializers.deserializeWith(RecordLocation.serializer, string)
        as RecordLocation;
  }

  /// Get the serializer for
  static Serializer<RecordLocation> get serializer =>
      _$recordLocationSerializer;
}

///
/// How long before the system auto powers off.
///
class AutoPowerOff extends EnumClass {
  static const AutoPowerOff disable = _$disable;
  static const AutoPowerOff immediately = _$immediately;
  @BuiltValueEnumConst(wireName: '30')
  static const AutoPowerOff thirtySeconds = _$thirtySeconds;
  @BuiltValueEnumConst(wireName: '60')
  static const AutoPowerOff sixtySeconds = _$sixtySeconds;
  @BuiltValueEnumConst(wireName: '180')
  static const AutoPowerOff oneEightySeconds = _$oneEightySeconds;
  @BuiltValueEnumConst(wireName: '300')
  static const AutoPowerOff threeHundredSeconds = _$threeHundredSeconds;
  @BuiltValueEnumConst(wireName: '600')
  static const AutoPowerOff sixHundredSeconds = _$sixHundredSeconds;

  const AutoPowerOff._(String name) : super(name);

  /// The values for AutoPowerOff
  static BuiltSet<AutoPowerOff> get values => _$autoPowerOffValues;

  /// Get the value of  from string/
  static AutoPowerOff valueOf(String name) => _$autoPowerOffValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(AutoPowerOff.serializer, this)
        as String;
  }

  /// Deserialize
  static AutoPowerOff deserialize(String string) {
    return dataSerializers.deserializeWith(AutoPowerOff.serializer, string)
        as AutoPowerOff;
  }

  /// Get the serializer for
  static Serializer<AutoPowerOff> get serializer => _$autoPowerOffSerializer;
}

///
/// How long before the display auto powers off.
///
class AutoDisplayOff extends EnumClass {
  @BuiltValueEnumConst(wireName: '10')
  static const AutoDisplayOff tenSeconds = _$tenSecondsDisplay;
  @BuiltValueEnumConst(wireName: '20')
  static const AutoDisplayOff twentySeconds = _$twentySecondsDisplay;
  @BuiltValueEnumConst(wireName: '30')
  static const AutoDisplayOff thirtySeconds = _$thirtySecondsDisplay;
  @BuiltValueEnumConst(wireName: '60')
  static const AutoDisplayOff sixtySeconds = _$sixtySecondsDisplay;
  @BuiltValueEnumConst(wireName: '120')
  static const AutoDisplayOff oneTwentySeconds = _$oneTwentySecondsDisplay;
  @BuiltValueEnumConst(wireName: '180')
  static const AutoDisplayOff oneEightySeconds = _$oneEightySecondsDisplay;

  const AutoDisplayOff._(String name) : super(name);

  /// The values for AutoDisplayOff
  static BuiltSet<AutoDisplayOff> get values => _$autoDisplayOffValues;

  /// Get the value of  from string/
  static AutoDisplayOff valueOf(String name) => _$autoDisplayOffValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(AutoDisplayOff.serializer, this)
        as String;
  }

  /// Deserialize
  static AutoDisplayOff deserialize(String string) {
    return dataSerializers.deserializeWith(AutoDisplayOff.serializer, string)
        as AutoDisplayOff;
  }

  /// Get the serializer for
  static Serializer<AutoDisplayOff> get serializer =>
      _$autoDisplayOffSerializer;
}

///
/// Enum for the beep enable/disable
///
class BeepEnableDisable extends EnumClass {
  static const BeepEnableDisable enable = _$enableBeep;
  static const BeepEnableDisable diable = _$disableBeep;
  @BuiltValueEnumConst(wireName: 'disabletouch')
  static const BeepEnableDisable disableTouch = _$disabletouch;

  const BeepEnableDisable._(String name) : super(name);

  /// The values for BeepEnableDisable
  static BuiltSet<BeepEnableDisable> get values => _$beepEnableDisableValues;

  /// Get the value of  from string/
  static BeepEnableDisable valueOf(String name) =>
      _$beepEnableDisableValueOf(name);

  /// Serialize
  String serialize() {
    return dataSerializers.serializeWith(BeepEnableDisable.serializer, this)
        as String;
  }

  /// Deserialize
  static BeepEnableDisable deserialize(String string) {
    return dataSerializers.deserializeWith(BeepEnableDisable.serializer, string)
        as BeepEnableDisable;
  }

  /// Get the serializer for
  static Serializer<BeepEnableDisable> get serializer =>
      _$beepEnableDisableSerializer;
}

///
/// The still image record pieces.
///
class StillImageRecord extends EnumClass {
  static const StillImageRecord standard = _$standard;
  @BuiltValueEnumConst(wireName: 'auto_switch_card')
  static const StillImageRecord autoSwitchCard = _$autoSwitchCard;
  @BuiltValueEnumConst(wireName: 'rec_separately')
  static const StillImageRecord recSeparately = _$recSeperately;
  @BuiltValueEnumConst(wireName: 'rec_to_multiple')
  static const StillImageRecord recToMultiple = _$recToMultiple;

  const StillImageRecord._(String name) : super(name);

  /// The values for StillImageRecord.
  static BuiltSet<StillImageRecord> get values => _$stillImageRecordValues;

  /// Get the value of StillImageRecord for the string.
  static StillImageRecord valueOf(String name) =>
      _$stillImageRecordValueOf(name);

  /// Serialize StillImageRecord/
  String serialize() {
    return dataSerializers.serializeWith(StillImageRecord.serializer, this)
        as String;
  }

  /// Deserializer StillImageRecord.
  static StillImageRecord deserialize(String string) {
    return dataSerializers.deserializeWith(StillImageRecord.serializer, string)
        as StillImageRecord;
  }

  /// Get the serializer for StillImageRecord.
  static Serializer<StillImageRecord> get serializer =>
      _$stillImageRecordSerializer;
}

///
/// A value abilty for a type where enable/disable is the valid values.
///
abstract class EnableDisableValueAbility
    with ValueAbilityBase<EnableDisable>
    implements
        Built<EnableDisableValueAbility, EnableDisableValueAbilityBuilder> {
  /// Serializer for the ValueAbility.
  static Serializer<EnableDisableValueAbility> get serializer =>
      _$enableDisableValueAbilitySerializer;

  @override
  Serializer get mySerializer => serializer;

  /// Private constructor for ValueAbility
  EnableDisableValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory EnableDisableValueAbility(
          [void Function(EnableDisableValueAbilityBuilder)? updates]) =
      _$EnableDisableValueAbility;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(EnableDisableValueAbilityBuilder b) =>
      b..ability = ListBuilder(EnableDisable.values);

  /// Deserialize the ValueAbility from a map.
  static EnableDisableValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            EnableDisableValueAbility.serializer, jsonData)
        as EnableDisableValueAbility;
  }
}

///
/// A value ability for a type where still image record types are valid.
///
abstract class StillImageRecordValueAbility
    with
        ValueAbilityBase<EnableDisable>
    implements
        Built<StillImageRecordValueAbility,
            StillImageRecordValueAbilityBuilder> {
  /// Serializer for the ValueAbility.
  static Serializer<StillImageRecordValueAbility> get serializer =>
      _$stillImageRecordValueAbilitySerializer;

  @override
  Serializer get mySerializer => serializer;

  /// Private constructor for ValueAbility
  StillImageRecordValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory StillImageRecordValueAbility(
          [void Function(StillImageRecordValueAbilityBuilder)? updates]) =
      _$StillImageRecordValueAbility;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(StillImageRecordValueAbilityBuilder b) =>
      b..ability = ListBuilder(EnableDisable.values);

  /// Deserialize the ValueAbility from a map.
  static StillImageRecordValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            StillImageRecordValueAbility.serializer, jsonData)
        as StillImageRecordValueAbility;
  }
}

///
/// A value ability for a type where AutoPowerOff types are valid.
///
abstract class AutoPowerOffValueAbility
    with ValueAbilityBase<EnableDisable>
    implements
        Built<AutoPowerOffValueAbility, AutoPowerOffValueAbilityBuilder> {
  /// Serializer for the ValueAbility.
  static Serializer<AutoPowerOffValueAbility> get serializer =>
      _$autoPowerOffValueAbilitySerializer;

  @override
  Serializer get mySerializer => serializer;

  /// Private constructor for ValueAbility
  AutoPowerOffValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory AutoPowerOffValueAbility(
          [void Function(AutoPowerOffValueAbilityBuilder)? updates]) =
      _$AutoPowerOffValueAbility;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(AutoPowerOffValueAbilityBuilder b) =>
      b..ability = ListBuilder(EnableDisable.values);

  /// Deserialize the ValueAbility from a map.
  static AutoPowerOffValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            AutoPowerOffValueAbility.serializer, jsonData)
        as AutoPowerOffValueAbility;
  }
}

///
/// A value ability for a type where AutoDisplayOff types are valid.
///
abstract class AutoDisplayOffValueAbility
    with ValueAbilityBase<EnableDisable>
    implements
        Built<AutoDisplayOffValueAbility, AutoDisplayOffValueAbilityBuilder> {
  /// Serializer for the ValueAbility.
  static Serializer<AutoDisplayOffValueAbility> get serializer =>
      _$autoDisplayOffValueAbilitySerializer;

  @override
  Serializer get mySerializer => serializer;

  /// Private constructor for ValueAbility
  AutoDisplayOffValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory AutoDisplayOffValueAbility(
          [void Function(AutoDisplayOffValueAbilityBuilder)? updates]) =
      _$AutoDisplayOffValueAbility;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(AutoDisplayOffValueAbilityBuilder b) =>
      b..ability = ListBuilder(EnableDisable.values);

  /// Deserialize the ValueAbility from a map.
  static AutoDisplayOffValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            AutoDisplayOffValueAbility.serializer, jsonData)
        as AutoDisplayOffValueAbility;
  }
}

///
/// A value ability for a type where AutoPowerOff types are valid.
///
abstract class BeepEnableDisableValueAbility
    with
        ValueAbilityBase<EnableDisable>
    implements
        Built<BeepEnableDisableValueAbility,
            BeepEnableDisableValueAbilityBuilder> {
  /// Serializer for the ValueAbility.
  static Serializer<BeepEnableDisableValueAbility> get serializer =>
      _$beepEnableDisableValueAbilitySerializer;

  @override
  Serializer get mySerializer => serializer;

  /// Private constructor for ValueAbility
  BeepEnableDisableValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory BeepEnableDisableValueAbility(
          [void Function(BeepEnableDisableValueAbilityBuilder)? updates]) =
      _$BeepEnableDisableValueAbility;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(BeepEnableDisableValueAbilityBuilder b) =>
      b..ability = ListBuilder(EnableDisable.values);

  /// Deserialize the ValueAbility from a map.
  static BeepEnableDisableValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
            BeepEnableDisableValueAbility.serializer, jsonData)
        as BeepEnableDisableValueAbility;
  }
}


///
/// A value ability for a type where AutoPowerOff types are valid.
///
abstract class RecordLocationValueAbility
    with
        ValueAbilityBase<EnableDisable>
    implements
        Built<RecordLocationValueAbility,
            RecordLocationValueAbilityBuilder> {
  /// Serializer for the ValueAbility.
  static Serializer<RecordLocationValueAbility> get serializer =>
      _$recordLocationValueAbilitySerializer;

  @override
  Serializer get mySerializer => serializer;

  /// Private constructor for ValueAbility
  RecordLocationValueAbility._();

  /// Create the ValueAbility class with a nifty factory.
  factory RecordLocationValueAbility(
      [void Function(RecordLocationValueAbilityBuilder)? updates]) =
  _$RecordLocationValueAbility;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(RecordLocationValueAbilityBuilder b) =>
      b..ability = ListBuilder(EnableDisable.values);

  /// Deserialize the ValueAbility from a map.
  static RecordLocationValueAbility fromMap(Map<String, dynamic> jsonData) {
    return dataSerializers.deserializeWith(
        RecordLocationValueAbility.serializer, jsonData)
    as RecordLocationValueAbility;
  }
}
