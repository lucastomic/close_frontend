import 'dart:async';
import 'dart:ui' as ui;
import 'package:close_frontend/services/internet_service/internet_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ImageConversorFromNetwork {
  static Future<Uint8List> parse(String url) async {
    try {
      ByteData bytesData = await _getByteData(url);
      return _parseByteDataIntoUint8List(bytesData);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ByteData> _getByteData(String url) async {
    if (await _internetDoesntWork()) return _getByteDataIfInternetFails();
    return _getByteDataIfInternetSuccess(url);
  }

  static Future<bool> _internetDoesntWork() async {
    return !await InternetService.checkInternet();
  }

  static Future<ByteData> _getByteDataIfInternetFails() async {
    return await rootBundle.load('assets/connection_error.png');
  }

  static Future<ByteData> _getByteDataIfInternetSuccess(String url) async {
    var networkImage = NetworkImage(url);
    ImageInfo imageInfo = await _getImageInfoWhenNetworkImageLoad(networkImage);
    return _parseImageInfoToByteData(imageInfo);
  }

  static Future<ImageInfo> _getImageInfoWhenNetworkImageLoad(NetworkImage networkImage) async {
    var completer = Completer<ImageInfo>();
    networkImage.resolve(const ImageConfiguration()).addListener(ImageStreamListener((info, error) {
      completer.complete(info);
    }));
    return await completer.future;
  }

  static Future<ByteData> _parseImageInfoToByteData(ImageInfo info) async {
    ByteData? response = await info.image.toByteData(format: ui.ImageByteFormat.png);
    return response!;
  }

  static Uint8List _parseByteDataIntoUint8List(ByteData bytesData) {
    return bytesData.buffer.asUint8List();
  }
}
