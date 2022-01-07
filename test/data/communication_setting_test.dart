import 'dart:convert';
import 'dart:io';

import 'package:canon_ccapi/data/communication_setting.dart';
import 'package:test/test.dart';

String data = """{
 "nw01": {
 "lantype": "ether",
 "ipv4_ipaddressset": "manual",
 "ipv4_ipaddress": "192.168.1.2",
 "ipv4_subnetmask": "255.255.255.0",
 "ipv4_gateway": "0.0.0.0",
 "ipv6_useipv6": "disable",
 "ipv6_manual_setting": "",
 "ipv6_manual_address": "",
 "ipv6_prefixlength": "",
 "ipv6_gateway": "",
 "ssid": "",
 "method": "infrastructure",
 "channel": "",
 "authentication": "open",
 "encryption": "none",
 "keyindex": "",
 "password": ""
 }
}""";
String dataInner = """{
  "lantype": "ether",
  "ipv4_ipaddressset": "manual",
  "ipv4_ipaddress": "192.168.1.2",
  "ipv4_subnetmask": "255.255.255.0",
  "ipv4_gateway": "0.0.0.0",
  "ipv6_useipv6": "disable",
  "ipv6_manual_setting": "",
  "ipv6_manual_address": "",
  "ipv6_prefixlength": "",
  "ipv6_gateway": "",
  "ssid": "",
  "method": "infrastructure",
  "channel": "",
  "authentication": "open",
  "encryption": "none",
  "keyindex": "",
  "password": ""
}""";

void main() {
  test('Communication Setting - one', () {
    var decoder = const JsonDecoder();
    var info = CommunicationSetting.fromMap(decoder.convert(dataInner));
    expect(
        info,
        equals(CommunicationSetting((b) =>
          b
            ..lanType = LanType.ether
            ..ipv4Gateway = InternetAddress("0.0.0.0")
            ..ipv4IpAddress = InternetAddress("192.168.1.2")
            ..ipv4IpAddressSet = Ipv4AddressSet.manual
            ..ipv6ManualAddress = InternetAddress('0.0.0.0')
            ..ipv6UseIpv6 = EnableDisable.disable
            ..ipv6ManualSetting = EnableDisable.disable
            ..ipv4SubnetMask = InternetAddress('255.255.255.0')
            ..ipv6PrefixLength = ''
            ..ipv6Gateway = InternetAddress('0.0.0.0')
            ..authentication = ConnectionAuthentication.open
            ..ssid = ""
            ..method = ConnectionMethod.infrastructure
            ..encryption = ConnectionEncryption.none
            ..keyIndexInternal = ''
            ..password = ""
            ..channelInternal = ''
          )
        ));

  });

  test('Communication Setting - all', () {
    var decoder = const JsonDecoder();
    var info = AllCommunicationSettings.fromMap(decoder.convert(data));
    expect(
        info,
        equals(AllCommunicationSettings((b) =>
        b
          ..settings!["nw01"] = CommunicationSetting((b) =>
          b
            ..lanType = LanType.ether
            ..ipv4Gateway = InternetAddress("0.0.0.0")
            ..ipv4IpAddress = InternetAddress("192.168.1.2")
            ..ipv4IpAddressSet = Ipv4AddressSet.manual
            ..ipv4SubnetMask = InternetAddress('255.255.255.0')
            ..ipv6UseIpv6 = EnableDisable.disable
            ..ipv6ManualSetting = EnableDisable.disable
            ..ipv6PrefixLength = ''
            ..ipv6Gateway = InternetAddress('0.0.0.0')
            ..authentication = ConnectionAuthentication.open
            ..ssid = ""
            ..method = ConnectionMethod.infrastructure
            ..encryption = ConnectionEncryption.none
            ..keyIndexInternal = ''
            ..password = ""
            ..channelInternal = ''
          )
        )));
  });
}
