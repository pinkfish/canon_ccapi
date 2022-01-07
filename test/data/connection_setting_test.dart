import 'package:test/test.dart';

String data = """{
"set01":{
"commsetting":["nw01","unspecified"],
"functionsetting":["mode01","unspecified"]
},
"set02":{
"commsetting":["nw02","unspecified"],
"functionsetting":["mode03","unspecified"]
},
}""";

void main() {
  test('String.split() splits the string on the delimiter', () {
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });

  test('String.trim() removes surrounding whitespace', () {
    var string = '  foo ';
    expect(string.trim(), equals('foo'));
  });
}