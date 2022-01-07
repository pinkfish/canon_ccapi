import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:canon_ccapi/data/api_info.dart';

import 'package:test/test.dart';

String data = """{
"ver100": [
 {
 "path": "/ccapi/ver100/deviceinformation",
 "get": true,
 "post": false,
 "put": false,
 "delete": false
},
 {
 "path": "/ccapi/ver100/devicestatus/storage",
 "get": true,
 "post": false,
 "put": false,
 "delete": false
 }
 ],
 "ver110": [
 {
 "path": "/ccapi/ver110/functions/networkconnection",
 "get": true,
 "post": false,
 "put": false,
 "delete": false
},
 {
 "path": "/ccapi/ver110/contents",
"get": true,
"post": true,
"put": true,
"delete": true
}
 ]
}""";

void main() {
  test('api info parse', () {
    var decoder = JsonDecoder();
    var mystuff = decoder.convert(data);
    var newThingy = ApiList((b) => b
      ..apis["ver100"] = BuiltList.of([
        ApiInfo((b) => b
          ..supportsGet = true
          ..supportsPost = false
          ..supportsPut = false
          ..supportsDelete = false
          ..url = "/ccapi/ver100/deviceinformation"),
        ApiInfo((b) => b
          ..supportsGet = true
          ..supportsPost = false
          ..supportsPut = false
          ..supportsDelete = false
          ..url = "/ccapi/ver100/devicestatus/storage"),
      ])
      ..apis["ver110"] = BuiltList.of([
        ApiInfo((b) => b
          ..supportsDelete = false
          ..supportsGet = true
          ..supportsPut = false
          ..url = '/ccapi/ver110/functions/networkconnection'
          ..supportsPost = false),
        ApiInfo((b) => b
          ..supportsDelete = true
          ..supportsGet = true
          ..supportsPut = true
          ..url = '/ccapi/ver110/contents'
          ..supportsPost = true),
      ]));
    var info = ApiList.fromMap(mystuff as Map<String, dynamic>);
    expect(info, equals(newThingy));
  });
}
