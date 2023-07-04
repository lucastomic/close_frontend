import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_form/social_network_input/social_network_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/authentication/auth_provider.dart';

class SocialNetowrksForm extends StatefulWidget {
  final ISocialNetworkService _socialNetworkService;
  const SocialNetowrksForm(this._socialNetworkService);

  @override
  State<SocialNetowrksForm> createState() => _SocialNetowrksFormState();
}

class _SocialNetowrksFormState extends State<SocialNetowrksForm> {
  late final User authenticatedUser;

  @override
  void initState() {
    _initializeAuthenticatedUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm<SocialNetwork,String?>(
      inputs: _getFormInputsList(),
      submitButtonText: "Guardar",
      onSubmit:_onSubmit,
    );
  }

  void _initializeAuthenticatedUser(){
    authenticatedUser = context.read<AuthenticationProvider>().authenticatedUser;
  }

  Future<void> _onSubmit(Map<SocialNetwork, String?> inputs)async{
    inputs.forEach((socialNetwork, username) {
      username != null ? widget._socialNetworkService.updateSocialNetwork(socialNetwork, username):
      widget._socialNetworkService.removeSocialNetwork(socialNetwork);
    });
    Navigator.of(context).pop();
  }

  FormInputsList<SocialNetwork,String?> _getFormInputsList(){
    Map<SocialNetwork,FormInput<String?>> inputs = {};
    for(SocialNetwork socialNetwork in SocialNetwork.values){
      inputs.addAll(_getSocialNetworkInputMapEntry(socialNetwork));
    }
    return FormInputsList(inputs);
  }

  Map<SocialNetwork,FormInput<String?>>_getSocialNetworkInputMapEntry(SocialNetwork socialNetwork){
      return {socialNetwork: SocialNetworkInput(
        socialNetwork, 
        initialValue: authenticatedUser.socialNetworks[socialNetwork]
      )};
  }
}