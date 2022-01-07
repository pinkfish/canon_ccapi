import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:canon_ccapi/data/battery_info.dart';
import 'package:test/test.dart';

String data = """{
"name": "LP-E12",
"kind": "battery",
"level": "full",
"quality": "good"
}""";

String dataGrip = """{"batterylist":[
{
"position":"grip02",
"kind":"battery",
"name":"LP-E6",
"quality":"good",
"level":"100"
},
{
"position":"grip01",
"kind":"battery",
"name":"LP-E6",
"quality":"normal",
"level":"50"}
]}""";

void main() {
  test('Battery info', () {
    var decoder = JsonDecoder();
    var info = BatteryInfo.fromMap(decoder.convert(data));
    expect(
        info,
        equals(BatteryInfo((b) => b
          ..name = "LP-E12"
          ..kind = BatteryKind.battery
          ..level = BatteryLevel.full
          ..quality = BatteryQuality.good)));
  });

  test('Battery list', () {
    var decoder = JsonDecoder();
    var info = BatteryList.fromMap(decoder.convert(dataGrip));
    expect(
        info,
        equals(BatteryList((b) => b
          ..batteryList = ListBuilder([
            BatteryListInfo((b) => b
              ..position = BatteryPosition.grip02
              ..name="LP-E6"
              ..kind = BatteryKind.battery
              ..innerLevel = "100"
              ..quality = BatteryQuality.good),
            BatteryListInfo((b) => b
              ..position = BatteryPosition.grip01
              ..kind = BatteryKind.battery
              ..name="LP-E6"
              ..innerLevel = "50"
              ..quality = BatteryQuality.normal)

          ]))));
  });
}
