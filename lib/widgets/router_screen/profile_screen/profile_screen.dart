import 'package:close_frontend/domain/user/authenticated_user.dart';
import 'package:close_frontend/image_manage/image_picker/image_picker_port.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/duck_service/duck_service_port.dart';
import 'package:close_frontend/services/profile_photo/profile_photo_service_port.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/basic_profile_info.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/buttons/log_out_button.dart';
import 'package:close_frontend/widgets/util_widgets/social_networks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'buttons/navigable_button.dart';


class ProfileScreen extends StatelessWidget {
  final ImagePickerPort _imagePickerPort;
  final IProfilePhotoService _photoService;
  final IDuckService _duckService;
  ProfileScreen(this._imagePickerPort,this._photoService, this._duckService);

  late AuthenticatedUser user;

  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthenticationProvider>().authenticatedUser;
    return SafeArea(
      child: CustomScrollView(  
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  BasicProfileInfo(user,_imagePickerPort,_photoService, _duckService),
                  const Spacer(),
                  SocialNetworksList(
                    user.socialNetworks,
                    spaceBetweenRows: 28,
                    fontSize: 16,
                    logoSize: 24,
                  ),
                  const Spacer(),
                  NavigableButton("Intereses","modifyInterests"), 
                  NavigableButton("Redes sociales", "modifySocialNetworks"),
                  const LogOutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

