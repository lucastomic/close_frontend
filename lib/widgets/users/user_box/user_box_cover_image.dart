import 'dart:typed_data';

import 'package:close_frontend/image_processing/image_conversor_from_network.dart';
import 'package:flutter/material.dart';

class UserBoxCoverImage extends StatefulWidget {
  final String _imageUrl;
  UserBoxCoverImage(this._imageUrl);

  @override
  State<UserBoxCoverImage> createState() => _UserBoxCoverImageState();
}

class _UserBoxCoverImageState extends State<UserBoxCoverImage> {
  Future<Uint8List> _convertImageFromUrl() async {
    return await ImageConversorFromNetwork.parse(widget._imageUrl);
  }

  @override
  void initState() {
    _convertImageFromUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
        child: FutureBuilder(
            future: _convertImageFromUrl(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Image.memory(snapshot.data, height: 150, width: 100, fit: BoxFit.cover);
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
