import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:canon_ccapi/data/connection_setting.dart';
import 'package:test/test.dart';

String data = """{
"set01":{
"commsetting":["nw01","unspecified"],
"functionsetting":["mode01","unspecified"]
},
"set02":{
"commsetting":["nw02","unspecified"],
"functionsetting":["mode03","unspecified"]
}
}""";

void main() {
  test('Connection Setting - one', () {
    var decoder = const JsonDecoder();
    var info = AllConnectionSettings.fromMap(decoder.convert(data));
    expect(
        info,
        equals(AllConnectionSettings((b) => b
          ..settings['set01'] = ConnectionSetting((b) => b
            ..commSetting = ListBuilder(['nw01', 'unspecified'])
            ..functionSetting = ListBuilder(['mode01', 'unspecified']))
            ..settings['set02'] = ConnectionSetting((b) => b
              ..commSetting = ListBuilder(['nw02', 'unspecified'])
              ..functionSetting = ListBuilder(['mode03', 'unspecified'])),
        )));
  });
}
