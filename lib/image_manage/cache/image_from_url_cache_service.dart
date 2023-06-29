import 'dart:collection';
import 'dart:typed_data';
import 'package:close_frontend/image_manage/image_conversor/image_conversor_from_network.dart';

class ImageFromURLCacheService {
  static final HashMap<String, Uint8List> _alreadyLoadedImages = HashMap();

  static Future<Uint8List> getImageFrom(String url) async {
    if (_urlIsInCache(url)) {
      return _alreadyLoadedImages[url]!;
    } else {
      return _parseAndSave(url);
    }
  }

  static Future<Uint8List> _parseAndSave(String url) async {
    Uint8List parsedImage = await ImageConversorFromNetwork.parse(url);
    _alreadyLoadedImages.putIfAbsent(url, () => parsedImage);
    return parsedImage;
  }

  static bool _urlIsInCache(String url) {
    return _alreadyLoadedImages.containsKey(url);
  }
}
