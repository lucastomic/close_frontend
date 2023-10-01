import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/image_manage/image_picker/image_picker_port.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/services/profile_photo/profile_photo_service_port.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/ducks_received_from_stream.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/profile_name_and_username.dart';
import 'package:flutter/material.dart';
import 'photo_button_to_edit_profile.dart';

class BasicProfileInfo extends StatelessWidget {
  final AuthenticatedUser _user;
  final ImagePickerPort _imagePicker;
  final IProfilePhotoService _photoService;
  final IDuckService _duckService;
  const BasicProfileInfo(this._user, this._imagePicker, this._photoService, this._duckService);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PhotoButtonToEditProfile(_user.presentationImage, _imagePicker, _photoService),
        const SizedBox(height: 4,),
        ProfileNameAndUsername(_user,usernameFontSize: 14,profileNameFontSize: 22,),
        const SizedBox(height: 4,),
        DucksReceivedFromStream(_duckService.getDucksReceivedStream(), _user.ducksReceived)
      ],
    );
  }
}

