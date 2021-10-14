library canon_ccapi;

import 'dart:convert';
import 'dart:io';

import 'package:canon_ccapi/data/api_info.dart';
import 'package:canon_ccapi/data/battery_info.dart';
import 'package:canon_ccapi/data/copyright_info.dart';
import 'package:canon_ccapi/data/lens_info.dart';
import 'package:canon_ccapi/data/storage_info.dart';
import 'package:canon_ccapi/data/temperature_info.dart';
import 'package:http/http.dart' as http;

import 'data/camera_info.dart';

/// Type of the exception thrown by the camera.
enum CameraExceptionType {
  badRequest,
  unauthorized,
  notFound,
  methodNotAllowed,
  conflict,
  rangeNotSatisfiable,
  internalError,
  serviceUnavailable,
}

///
/// Exception for the camera stuff.
///
class CameraException implements Exception {
  final CameraExceptionType type;

  CameraException(this.type);
}

///
/// The class to talk to the camera.
///
class Camera {
  final Uri _cameraUri;
  final ApiList _apiList;
  final JsonDecoder _json;
  static const List<String> _versions = ['ver100', 'ver110'];
  static const JsonEncoder _encoder = const JsonEncoder();

  Camera._(
      {required Uri cameraUri,
      required ApiList apiList,
      required JsonDecoder json})
      : _cameraUri = cameraUri,
        _apiList = apiList,
        _json = json;

  static bool _checkResult(int status) {
    switch (status) {
      case 200:
      case 201:
      case 206:
        return true;
      case 400:
        throw CameraException(CameraExceptionType.badRequest);
      case 401:
        throw CameraException(CameraExceptionType.unauthorized);
      case 404:
        throw CameraException(CameraExceptionType.notFound);
      case 405:
        throw CameraException(CameraExceptionType.methodNotAllowed);
      case 409:
        throw CameraException(CameraExceptionType.conflict);
      case 416:
        throw CameraException(CameraExceptionType.rangeNotSatisfiable);
      case 500:
        throw CameraException(CameraExceptionType.internalError);
      case 503:
        throw CameraException(CameraExceptionType.serviceUnavailable);
    }
    return false;
  }

  static Future<Map<String, dynamic>> _getData(String api, Camera ob) async {
    var url = ob._apiList.getUrl(_versions, api);
    var getUrl = ob._cameraUri.replace(path: url);

    var data = await http.get(getUrl);
    if (_checkResult(data.statusCode)) {
      return ob._json.convert(data.body);
    }
    throw const HandshakeException();
  }

  static Future<void> _putData(
      String api, Camera ob, Map<dynamic, dynamic> data) async {
    var url = ob._apiList.getUrl(_versions, api);
    var getUrl = ob._cameraUri.replace(path: url);

    var result = await http.put(getUrl, body: _encoder.convert(data));
    if (_checkResult(result.statusCode)) {
      return ob._json.convert(result.body);
    }
    throw const HandshakeException();
  }

  static Future<void> _deleteData(String api, Camera ob) async {
    var url = ob._apiList.getUrl(_versions, api);
    var getUrl = ob._cameraUri.replace(path: url);

    var result = await http.delete(getUrl);
    if (_checkResult(result.statusCode)) {
      return ob._json.convert(result.body);
    }
    throw const HandshakeException();
  }

  factory({required Uri cameraUri}) async {
    Uri versionsUrl = _cameraUri.replace(path: 'ccapi');

    var data = await http.get(versionsUrl);
    if (_checkResult(data.statusCode)) {
      var decoder = const JsonDecoder();

      var info = ApiList.fromMap(decoder.convert(data.body));
      // Convert the data into something useful.
      return Camera._(cameraUri: cameraUri, apiList: info, json: decoder);
    }
  }

  /// Get the information for the camera.
  Future<CameraInfo> getCameraInfo() async {
    var data = await _getData('deviceinformation', this);
    return CameraInfo.fromMap(data);
  }

  /// Get the list of storage locations from the camera.
  Future<StorageInfoList> getStorageList() async {
    var data = await _getData('devicestatus/storage', this);
    return StorageInfoList.fromMap(data);
  }

  /// Get the list of storage locations from the camera.
  Future<StorageDestinationList> getStorageDestinations() async {
    var data = await _getData('devicestatus/currentstorage', this);
    return StorageDestinationList.fromMap(data);
  }

  /// Get the list of storage locations from the camera.
  Future<StorageDestinationInfo> getCurrentDirectory() async {
    var data = await _getData('devicestatus/currentdirectory', this);
    return StorageDestinationInfo.fromMap(data);
  }

  /// Get the battery from the camera.
  Future<BatteryInfo> getBatteryInfo() async {
    var data = await _getData('devicestatus/battery', this);
    return BatteryInfo.fromMap(data);
  }

  /// Get the list of batteries locations from the camera.
  Future<BatteryList> getBatteryList() async {
    var data = await _getData('devicestatus/batterylist', this);
    return BatteryList.fromMap(data);
  }

  /// Get the lens from the camera.
  Future<LensInfo> getLens() async {
    var data = await _getData('devicestatus/lens', this);
    return LensInfo.fromMap(data);
  }

  /// Get the temperature from the camera.
  Future<TemperatureInfo> getTemperature() async {
    var data = await _getData('devicestatus/temperature', this);
    return TemperatureInfo.fromMap(data);
  }

  /// Get the copyright from the camera.
  Future<CopyrightInfo> getCopyright() async {
    var data = await _getData('functions/registeredname/copyright', this);
    return CopyrightInfo.fromMap(data);
  }

  /// Get the copyright from the camera.
  Future<void> setCopyright(String name) async {
    var data = CopyrightInfo((b) => b..copyright = name);
    return await _putData(
        'functions/registeredname/copyright', this, data.toMap());
  }

  /// Get the copyright from the camera.
  Future<void> deleteCopyright(String name) async {
    return await _deleteData('functions/registeredname/copyright', this);
  }
}
