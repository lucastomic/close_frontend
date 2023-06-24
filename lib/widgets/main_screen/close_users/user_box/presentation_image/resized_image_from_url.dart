import 'dart:typed_data';

import 'package:close_frontend/widgets/centred_circular_progress_indicator.dart';
import 'package:close_frontend/image_processing/cache/image_from_url_cache_service.dart';
import 'package:flutter/material.dart';

class ResizedImageWithLoading extends StatelessWidget {
  final String _imageURL;
  late final Future<Uint8List> _imageConvertedFromURL = ImageFromURLCacheService.getImageFrom(_imageURL);

  ResizedImageWithLoading(this._imageURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _imageConvertedFromURL, builder: _buildFromSnapshot);
  }

  Widget _buildFromSnapshot(_, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return _ResizedImage(snapshot.data);
    } else {
      return const CentredCircularProgressIndicator();
    }
  }
}

class _ResizedImage extends StatelessWidget {
  final double _height = 150;
  final double _width = 100;
  final Uint8List _image;
  const _ResizedImage(this._image);

  @override
  Widget build(BuildContext context) {
    return Image.memory(_image, height: _height, width: _width, fit: BoxFit.cover);
  }
}
