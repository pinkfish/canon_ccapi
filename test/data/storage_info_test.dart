import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:canon_ccapi/data/storage_info.dart';
import 'package:test/test.dart';

String dataV10 = """{
 "storagelist": [
 {
 "name": "sd",
 "url": "http://192.168.1.2:8080/ccapi/ver100/contents/sd",
 "accesscapability": "readwrite",
 "maxsize": 4016570368,
 "spacesize": 3800924160,
 "contentsnumber": 511
 }
 ]
}""";

String dataV11 = """
{
 "storagelist": [
 {
 "name": "cfex1",
 "path": "/ccapi/ver110/contents/cfex1",
 "accesscapability": "readwrite",
 "maxsize": 4016570368,
 "spacesize": 3800924160,
 "contentsnumber": 511
 },
 {
 "name": "cfex2",
 "path": "/ccapi/ver110/contents/cfex2",
 "accesscapability": "readwrite",
 "maxsize": 4016570368,
 "spacesize": 3800924160,
 "contentsnumber": 511
 }
 ]
}
""";

void main() {
  test('storage info - v1', () {
    var decoder = const JsonDecoder();
    var info = StorageInfoList.fromMap(decoder.convert(dataV10));
    expect(
        info,
        equals(StorageInfoList(
          (b) => b
            ..storageList = ListBuilder([
              StorageInfo((b) => b
                ..name = 'sd'
                ..url = "http://192.168.1.2:8080/ccapi/ver100/contents/sd"
                ..accessCapability = AccessCapability.readwrite
                ..maxsize = 4016570368
                ..spaceSize = 3800924160
                ..contentsNumber = 511),
            ]),
        )));
  });
  test('storage info - v1.1', () {
    var decoder = const JsonDecoder();
    var info = StorageInfoList.fromMap(decoder.convert(dataV11));
    expect(
        info,
        equals(StorageInfoList(
              (b) => b
            ..storageList = ListBuilder([
              StorageInfo((b) => b
                ..name = 'cfex1'
                ..path = "/ccapi/ver110/contents/cfex1"
                ..accessCapability = AccessCapability.readwrite
                ..maxsize = 4016570368
                ..spaceSize = 3800924160
                ..contentsNumber = 511),
              StorageInfo((b) => b
                ..name = 'cfex2'
                ..path = "/ccapi/ver110/contents/cfex2"
                ..accessCapability = AccessCapability.readwrite
                ..maxsize = 4016570368
                ..spaceSize = 3800924160
                ..contentsNumber = 511),
            ]),
        )));
  });

}
