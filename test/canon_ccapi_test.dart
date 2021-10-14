import 'package:flutter_test/flutter_test.dart';

String xml = """<?xml version="1.0"?>
<root xmlns="urn:schemas-upnp-org:device-1-0">
<specVersion>
<major>1</major>
<minor>0</minor>
</specVersion>
<URLBase>http://192.168.1.2:49152/upnp/</URLBase>
<device>
<deviceType>urn:schemas-canon-com:device:ICPO-CameraControlAPIService:1</deviceType>
<friendlyName>Degital Camera</friendlyName>
<manufacturer>Canon</manufacturer>
<manufacturerURL>http://www.canon.com/</manufacturerURL>
<modelDescription>Canon Digital Camera</modelDescription>
<modelName>Degital Camera</modelName>
<serialNumber>012345678901</serialNumber>
<UDN>uuid:00000000-0000-0607-0001-0A0B0C0D0E0F</UDN>
<serviceList>
<service>
<serviceType>urn:schemas-canon-com:service:ICPO-CameraControlAPIService:1</serviceType>
<serviceId>urn:schemas-canon-com:serviceId:ICPO-CameraControlAPIService-1</serviceId>
<SCPDURL>CameraSvcDesc.xml</SCPDURL>
<controlURL>control/CanonCamera/</controlURL>
<eventSubURL></eventSubURL>
<ns:X_onService xmlns:ns="urn:schemas-canon-com:schema-upnp">0</ns:X_onService>
<ns:X_accessURL xmlns:ns="urn:schemas-canon-com:schemaupnp">http://192.168.1.2:8080/ccapi</ns:X_accessURL>
<ns:X_deviceNickname xmlns:ns="urn:schemas-canon-com:schemaupnp">Camera</ns:X_deviceNickname>
</service>
</serviceList>
<presentationURL>/</presentationURL>
</device>
</root>
""";

void main() {
  test('adds one to input values', () {
  });
}
