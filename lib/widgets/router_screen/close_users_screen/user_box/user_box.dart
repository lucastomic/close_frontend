import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/services/message_service/message_service_port.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/card_content.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_box/presentation_image/user_box_presentation_image.dart';
import 'package:flutter/material.dart';

class UserBox extends StatefulWidget {
  final User _user;
  final ImageQualityReducer _qualityReducer;
  final IMessageService _messageService;

  const UserBox(this._user,this._qualityReducer, this._messageService);

  @override
  State<UserBox> createState() => _UserBoxState();
}

class _UserBoxState extends State<UserBox> {
  final double height = 150;
  late String presentationImageWithQualityReduced; 
  @override
  void initState() {
    String presentationImage = widget._user.presentationImage;
    presentationImageWithQualityReduced = widget._qualityReducer.getURLWithReducedQuality(presentationImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: _getDecoration(),
      margin: _getMargin(),
      child: Row(
        children: [
          UserBoxPresentationImage(presentationImageWithQualityReduced), 
          UserBoxCardContent(widget._user, widget._messageService)
        ],
      ),
    );
  }

  EdgeInsetsGeometry _getMargin() {
    return const EdgeInsets.only(bottom: 20, left: 25, right: 25);
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(width: .3, color: Colors.black45)
    );
  }
}
