import 'dart:convert';

import 'package:canon_ccapi/data/temperature_info.dart';
import 'package:test/test.dart';


String data = """{
"status": "normal"
}""";

void main() {
  test('storage info - v1', () {
    var decoder = const JsonDecoder();
    var info = TemperatureInfo.fromMap(decoder.convert(data));
    expect(
        info,
        equals(TemperatureInfo(
              (b) => b
            ..status = TemperatureStatus.normal
        )));
  });
}