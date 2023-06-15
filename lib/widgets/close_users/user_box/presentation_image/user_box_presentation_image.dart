// ignore_for_file: use_key_in_widget_constructors

import 'package:close_frontend/widgets/close_users/user_box/presentation_image/resized_image_from_url.dart';
import 'package:flutter/material.dart';

class UserBoxPresentationImage extends StatefulWidget {
  final String _imageUrl;
  const UserBoxPresentationImage(this._imageUrl);

  @override
  State<UserBoxPresentationImage> createState() => _UserBoxPresentationImageState();
}

class _UserBoxPresentationImageState extends State<UserBoxPresentationImage> {
  final double _borderRadius = 15;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: _getBorderRadius(), child: ResizedImageWithLoading(widget._imageUrl));
  }

  BorderRadius _getBorderRadius() {
    return BorderRadius.horizontal(left: Radius.circular(_borderRadius));
  }
}
