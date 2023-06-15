import 'package:close_frontend/widgets/close_users/user_box/cover_image/resized_image_from_url.dart';
import 'package:flutter/material.dart';

class UserBoxCoverImage extends StatefulWidget {
  final String _imageUrl;
  const UserBoxCoverImage(this._imageUrl, {super.key});

  @override
  State<UserBoxCoverImage> createState() => _UserBoxCoverImageState();
}

class _UserBoxCoverImageState extends State<UserBoxCoverImage> {
  final double _borderRadius = 15;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: _getBorderRadius(), child: ResizedImageFromURLWithLoading(widget._imageUrl));
  }

  BorderRadius _getBorderRadius() {
    return BorderRadius.horizontal(left: Radius.circular(_borderRadius));
  }
}
