library canon_ccapi;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:canon_ccapi/data/api_info.dart';
import 'package:canon_ccapi/data/battery_info.dart';
import 'package:canon_ccapi/data/communication_setting.dart';
import 'package:canon_ccapi/data/lens_info.dart';
import 'package:canon_ccapi/data/temperature_info.dart';
import 'package:canon_ccapi/data/value_ability.dart';
import 'package:canon_ccapi/data/wifi_setting.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'data/camera_info.dart';
import 'data/connection_setting.dart';
import 'data/network_function_modes.dart';
import 'data/shutter_button.dart';
import 'data/storage_info.dart';

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

  /// The versions in order to try.
  static const List<String> _versions = ['ver110', 'ver100'];
  static const JsonEncoder _encoder = JsonEncoder();
  static final DateFormat _dateFormat =
      DateFormat("EEE, dd MMM yyyy hh:mm:ss Z", 'en-us');

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

  static String _getVersion(String api, Camera ob) {
    return ob._apiList.getVersion(_versions, api);
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

  static Future<http.ByteStream> _getStream(String api, Camera ob) async {
    var url = ob._apiList.getUrl(_versions, api);
    var getUrl = ob._cameraUri.replace(path: url);

    var request = http.Request('get', url);
    var response = await request.send();
    if (_checkResult(response.statusCode)) {
      return response.stream;
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

  static Future<void> _postData(
      String api, Camera ob, Map<dynamic, dynamic> data) async {
    var url = ob._apiList.getUrl(_versions, api);
    var getUrl = ob._cameraUri.replace(path: url);

    var result = await http.post(getUrl, body: _encoder.convert(data));
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

  Future<String> _getString(String api, String name) async {
    var data = await _getData(api, this);
    return data[name];
  }

  Future<void> _putString(String api, String name, String value) async {
    Map<String, String> stuff = {};
    stuff[name] = value;
    await _putData(api, this, stuff);
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
  Future<String> getCopyrightHolder() async {
    return _getString('functions/registeredname/copyright', 'copyright');
  }

  /// Set the copyright on the camera.
  Future<void> setCopyrightHolder(String name) async {
    return await _putString(
        'functions/registeredname/copyright', 'copyright', name);
  }

  /// Delete the copyright from the camera.
  Future<void> deleteCopyrightHolder() async {
    return await _deleteData('functions/registeredname/copyright', this);
  }

  /// Get the Author from the camera.
  Future<String> getAuthorHolder() async {
    return _getString('functions/registeredname/author', 'author');
  }

  /// Set the Author on the camera.
  Future<void> setAuthor(String name) async {
    return await _putString('functions/registeredname/author', 'author', name);
  }

  /// Delete the Author from the camera.
  Future<void> deleteAuthor() async {
    return await _deleteData('functions/registeredname/author', this);
  }

  /// Get the ownername from the camera.
  Future<String> getOwnerName() async {
    return _getString('functions/registeredname/ownername', 'ownername');
  }

  /// Set the ownername on the camera.
  Future<void> setOwnerName(String name) async {
    return await _putString(
        'functions/registeredname/ownername', 'ownername', name);
  }

  /// Delete the ownername from the camera.
  Future<void> deleteOwnerName() async {
    return await _deleteData('functions/registeredname/ownername', this);
  }

  /// Get the nickname from the camera.
  Future<String> getNickname() async {
    return _getString('functions/registeredname/nickname', 'nickname');
  }

  /// Set the nickname on the camera.
  Future<void> setNickname(String name) async {
    return await _putString(
        'functions/registeredname/nickname', 'nickname', name);
  }

  /// Delete the nickname from the camera.
  Future<void> deleteNickname() async {
    return await _deleteData('functions/registeredname/nickname', this);
  }

  /// Get the nickname from the camera.
  Future<DateTime> getDateTime() async {
    var data = await _getData('functions/datetime', this);
    var val = HttpDate.parse(data["datetime"]);
    return val;
  }

  /// Set the nickname on the camera.
  Future<void> setDateTime(DateTime t, [bool dst = false]) async {
    return await _putData('functions/datetime', this, {
      'datetime': _dateFormat.format(t),
      'dst': dst,
    });
  }

  /// Formats the specified storage on the camera.
  Future<void> formatCard(String storageName) {
    return _postData('functions/cardformat', this, {
      'name': storageName,
    });
  }

  ///
  /// Gets the current beep setting.
  ///
  Future<BeepEnableDisableValueAbility> getBeepSetting() async {
    var data = await _getData('functions/beep', this);
    return BeepEnableDisableValueAbility.fromMap(data);
  }

  ///
  /// Sets the current beep setting.
  ///
  Future<void> setBeepSetting(BeepEnableDisable value) async {
    return _putString('functions/beep', 'value', value.toString());
  }

  ///
  /// Gets the current beep setting.
  ///
  Future<AutoDisplayOffValueAbility> getAutoDisplayOffSetting() async {
    var data = await _getData('functions/displayoff', this);
    return AutoDisplayOffValueAbility.fromMap(data);
  }

  ///
  /// Sets the current beep setting.
  ///
  Future<void> setAutoDisplayOff(AutoDisplayOff value) async {
    return _putString('functions/displayoff', 'value', value.toString());
  }

  ///
  /// Gets the current auto power off setting.
  ///
  Future<AutoPowerOffValueAbility> getAutoPowerOffSetting() async {
    var data = await _getData('functions/autopoweroff', this);
    return AutoPowerOffValueAbility.fromMap(data);
  }

  ///
  /// Sets the current auto power off setting.
  ///
  Future<void> setAutoPowerOffSetting(AutoPowerOff value) async {
    return _putString('functions/autopoweroff', 'value', value.toString());
  }

  /// Disconnects the network connection.
  Future<void> disconnectCommunication() {
    return _postData(
        'functions/networkconnection', this, {'action': 'disconnect'});
  }

  /// Disconnects the network connection.
  Future<void> disconnectWifiConnection() {
    return _postData(
        'functions/wificonnection', this, {'action': 'disconnect'});
  }

  /// Reboots the camera.
  Future<void> rebootCamera() {
    return _postData('functions/networkconnection', this, {'action': 'reboot'});
  }

  ///
  /// Gets the current beep setting.
  ///
  Future<ValueAbility> getCurrentConnectionSetting() async {
    var data = await _getData(
        'functions/networksetting/currentconnectionsetting', this);
    return ValueAbility.fromMap(data);
  }

  ///
  /// Sets the current beep setting.
  ///
  Future<void> setCurrentConnectionSetting(String value) async {
    return _putString(
        'functions/networksetting/currentconnectionsetting', 'value', value);
  }

  ///
  /// Gets the current beep setting.
  ///
  Future<AllConnectionSettings> getAllConnectionSettings() async {
    var data =
        await _getData('functions/networksetting/connectionsetting', this);
    return AllConnectionSettings.fromMap(data);
  }

  ///
  /// Gets the connection setting for the specified set.
  ///
  Future<ConnectionSetting> getConnectionSetting(String name) async {
    var data = await _getData(
        'functions/networksetting/connectionsetting/$name', this);

    return ConnectionSetting.fromMap(data);
  }

  ///
  /// Sets the connection setting for the specified set.
  ///
  Future<void> setConnectionSetting(
      String name, ConnectionSetting setting) async {
    return await _putData('functions/networksetting/connectionsetting/$name',
        this, setting.toMap());
  }

  ///
  /// Deletes the connection setting for the specified set.
  ///
  Future<void> deleteConnectionSetting(String name) async {
    return await _deleteData(
        'functions/networksetting/connectionsetting/$name', this);
  }

  ///
  /// Gets all the communication settings.
  ///
  Future<AllCommunicationSettings> getAllCommunicationSettings() async {
    var data = await _getData('functions/networksetting/commsetting', this);
    return AllCommunicationSettings.fromMap(data);
  }

  ///
  /// Gets  the specific communication settings.
  ///
  Future<CommunicationSetting> getCommunicationSetting(String name) async {
    var data =
        await _getData('functions/networksetting/commsetting/$name', this);
    return CommunicationSetting.fromMap(data);
  }

  ///
  /// Gets  the specific communication settings.
  ///
  Future<void> setCommunicationSetting(
      String name, CommunicationSetting setting) async {
    return await _putData(
        'functions/networksetting/commsetting/$name', this, setting.toMap());
  }

  ///
  /// Gets the network function settings for the camera.
  ///
  Future<AllNetworkFunctionModes> getAllNetworkFunctionModes() async {
    var data = await _getData('functions/networksetting/functionsetting', this);
    return AllNetworkFunctionModes.fromMap(data);
  }

  ///
  /// Gets the specific network function settings mode for the camera.
  ///
  Future<NetworkFunctionMode> getNetworkFunctionMode(String modeName) async {
    var data = await _getData(
        'functions/networksetting/functionsetting/$modeName', this);
    return NetworkFunctionMode.fromMap(data);
  }

  ///
  /// Gets  the specific network function mode on the camera.
  ///
  Future<void> setNetworkFunctionMode(
      String modeName, NetworkFunctionMode setting) async {
    return await _putData('functions/networksetting/commsetting/$modeName',
        this, setting.toMap());
  }

  ///
  /// Deletes  the specific network function mode on the camera.
  ///
  Future<void> deleteNetworkFunctionMode(String modeName) async {
    return await _deleteData(
        'functions/networksetting/commsetting/$modeName', this);
  }

  ///
  /// Gets the wifi settings for the camera.
  ///
  Future<AllWifiSettings> getAllWifiSettings() async {
    var data = await _getData('functions/networksetting/wifisetting', this);
    return AllWifiSettings.fromMap(data);
  }

  ///
  /// Gets the specific wifi settings mode for the camera.
  ///
  Future<WifiSetting> getWifiSetting(String wifiName) async {
    var data =
        await _getData('functions/networksetting/wifisetting/$wifiName', this);
    return WifiSetting.fromMap(data);
  }

  ///
  /// Gets  the specific wifi settings on the camera.
  ///
  Future<void> setWifiSetting(String wifiName, WifiSetting setting) async {
    return await _putData('functions/networksetting/wifisetting/$wifiName',
        this, setting.toMap());
  }

  ///
  /// Deletes  the specific wifi setting on the camera.
  ///
  Future<void> deleteWifiSetting(String wifiName) async {
    return await _deleteData(
        'functions/networksetting/wifisetting/$wifiName', this);
  }

  ///
  /// Gets the current still image record setting.
  ///
  Future<StillImageRecordValueAbility> getRecordStillSetting() async {
    var data = await _getData('functions/recordfunctions/stillimage', this);
    return StillImageRecordValueAbility.fromMap(data);
  }

  ///
  /// Sets the current still image record setting.
  ///
  Future<void> setStillImageRecordSetting(StillImageRecord value) async {
    return _putString(
        'functions/recordfunctions/stillimage', 'value', value.toString());
  }

  ///
  /// Gets the current still image record setting.
  ///
  Future<StillImageRecordValueAbility> getMovieRecordSetting() async {
    var data = await _getData('functions/recordfunctions/movie', this);
    return StillImageRecordValueAbility.fromMap(data);
  }

  ///
  /// Sets the current still image record setting.
  ///
  Future<void> setMovieRecordSetting(StillImageRecord value) async {
    return _putString(
        'functions/recordfunctions/movie', 'value', value.toString());
  }

  ///
  /// Gets the current still image record setting.
  ///
  Future<RecordLocationValueAbility> getStillRecordLocation() async {
    var data = await _getData('functions/cardselection/stillimage', this);
    return RecordLocationValueAbility.fromMap(data);
  }

  ///
  /// Sets the current still image record setting.
  ///
  Future<void> setStillRecordLocation(RecordLocation value) async {
    return _putString(
        'functions/cardselection/stillimage', 'value', value.toString());
  }

  ///
  /// Gets the current still image record setting.
  ///
  Future<RecordLocationValueAbility> getMovieRecordLocation() async {
    var data = await _getData('functions/cardselection/movie', this);
    return RecordLocationValueAbility.fromMap(data);
  }

  ///
  /// Sets the current still image record setting.
  ///
  Future<void> setMovieRecordLocation(RecordLocation value) async {
    return _putString(
        'functions/cardselection/movie', 'value', value.toString());
  }

  ///
  /// Gets the current exposure level increments (aperture).
  ///
  Future<String> getExposureLevelIncrementsAperture() async {
    var data = await _getData('customfunctions/exposureincrements/av', this);
    return data['value'] as String;
  }

  ///
  /// Gets the current exposure level increments (shutter speed).
  ///
  Future<String> getExposureLevelIncrementsShutter() async {
    var data = await _getData('customfunctions/exposureincrements/tv', this);
    return data['value'] as String;
  }

  ///
  /// Gets the current exposure level increments (exposure compensation).
  ///
  Future<String> getExposureLevelIncrementsExposure() async {
    var data =
        await _getData('customfunctions/exposureincrements/exposure', this);
    return data['value'] as String;
  }

  ///
  /// Gets the current exposure level increments (exposure compensation).
  ///
  Future<String> getExposureLevelIncrementsFlashExposure() async {
    var data = await _getData(
        'customfunctions/exposureincrements/flashexposure', this);
    return data['value'] as String;
  }

  ///
  /// Gets the current exposure level increments (exposure compensation).
  ///
  Future<String> getISOSpeedLevelIncrements() async {
    var data = await _getData('customfunctions/isoincrements', this);
    return data['value'] as String;
  }

  ///
  /// Gets the current storage details.
  ///
  Future<StorageLocations> getStorageLocations() async {
    var data = await _getData('contents', this);
    return StorageLocations.fromMap(data);
  }

  ///
  /// Gets the current storage details.
  ///
  Future<StorageLocations> getStorageDirectories(String storage) async {
    var data = await _getData('contents/$storage', this);
    return StorageLocations.fromMap(data);
  }

  ///
  /// Gets the current storage details.
  ///
  Future<StorageLocations> getStorageContents(String storage, String path,
      {StorageContentType type = StorageContentType.all,
      StorageContentKind kind = StorageContentKind.list,
      int? page,
      bool? ascending}) async {
    String extra = '';
    if (page != null) {
      extra += ',page=$page';
    }
    if (ascending != null) {
      if (ascending) {
        extra += ',order=asc';
      } else {
        extra += ',order=desc';
      }
    }
    var data = await _getData(
        'contents/$storage/$path?type=$type,kind=$kind$extra', this);
    return StorageLocations.fromMap(data);
  }

  ///
  /// Delete the directory.
  ///
  Future<void> deleteDirectory(String storage, String path) async {
    await _deleteData('contents/$storage/$path', this);
  }

  ///
  /// Get the metadata for the contents.
  ///
  Future<StorageContentInfo> getContentMetadata(
      String storage, String path) async {
    var data = await _getData('contents/$storage/$path?type=info', this);
    return StorageContentInfo.fromMap(data);
  }

  ///
  /// Gets the thumbnail for the contents.
  ///
  Future<http.ByteStream> getContentThumbnail(
      String storage, String path) async {
    var data = await _getStream('contents/$storage/$path?type=thumbnail', this);
    return data;
  }

  ///
  /// Gets the main data fot the contents..
  ///
  Future<http.ByteStream> getContentMain(String storage, String path) async {
    var data = await _getStream('contents/$storage/$path?type=main', this);
    return data;
  }

  ///
  /// Gets the display data fot the contents..
  ///
  Future<http.ByteStream> getContentDisplay(String storage, String path) async {
    var data = await _getStream('contents/$storage/$path?type=display', this);
    return data;
  }

  ///
  /// Gets the embedded data fot the contents..
  ///
  Future<http.ByteStream> getContentEmbedded(
      String storage, String path) async {
    var data = await _getStream('contents/$storage/$path?type=embedded', this);
    return data;
  }

  ///
  /// Sets the rotation for the specific contents.
  ///
  Future<void> setContentRotation(String storage, String path, int rotation) {
    return _putData('contents/$storage/$path', this,
        {'value': rotation, 'action': 'rotate'});
  }

  ///
  /// Sets the protection for the specific contents.
  ///
  Future<void> setContentProtect(
      String storage, String path, EnableDisable value) {
    return _putData('contents/$storage/$path', this,
        {'value': value.toString(), 'action': 'protect'});
  }

  ///
  /// Sets the protection for the specific contents.
  ///
  Future<void> setContentArchive(
      String storage, String path, EnableDisable value) {
    return _putData('contents/$storage/$path', this,
        {'value': value.toString(), 'action': 'archive'});
  }

  ///
  /// Sets the protection for the specific contents.
  ///
  Future<void> setContentRating(String storage, String path, String rating) {
    return _putData(
        'contents/$storage/$path', this, {'value': rating, 'action': 'rating'});
  }

  ///
  /// Sets the protection for the specific contents.
  ///
  Future<void> deleteContent(String storage, String path) {
    return _deleteData('contents/$storage/$path', this);
  }

  ///
  /// Takes a shot with the current settings.
  ///
  Future<void> takeShot({bool autoFocus = true}) async {
    await _putData('shooting/control/shutterbutton', this, {'af': autoFocus});
  }

  ///
  /// Takes a shot with the current settings.
  ///
  Future<void> shutterButton(
      {ShutterButton action = ShutterButton.fullPress,
      bool autoFocus = true}) async {
    await _putData('shooting/control/shutterbutton/manual', this,
        {'af': autoFocus, 'action': action.toString()});
  }

  ///
  /// Get if a movie is currently being recorded.
  ///
  Future<bool> getRecordingMovie(bool start) async {
    var data = await _getData('shooting/control/moviemode', this);
    return data['status'] == 'on';
  }

  ///
  /// Start or stop recording a movie.
  ///
  Future<void> recordMovie(bool start) async {
    await _putData('shooting/control/moviemode', this, {'statue': start ? 'on' : 'off'});
  }


}
