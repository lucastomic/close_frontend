import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/expanded_form_inputs_list.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:close_frontend/widgets/forms/user_modifing/user_modifing_form.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_form/social_network_input/social_network_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/authentication/auth_provider.dart';

class SocialNetowrksForm extends StatefulWidget {
  final ISocialNetworkService _socialNetworkService;
  final String? _nextPage;

  const SocialNetowrksForm(
    this._socialNetworkService,
    {
        String? nextPage //If it's omitted it will Pop to the previous page as default
    }
  ) : _nextPage = nextPage;

  @override
  State<SocialNetowrksForm> createState() => _SocialNetowrksFormState();
}

class _SocialNetowrksFormState extends State<SocialNetowrksForm> {
  late final AuthenticationProvider _authenticationProvider;

  @override
  void initState() {
    _authenticationProvider = context.read<AuthenticationProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserModifingForm<SocialNetwork,String?>(
      inputs: _getFormInputsList(),
      submitButtonText: "Guardar",
      onSubmit:(inputs)=>_updateSocialNetworks(inputs,context),
      nextPage: widget._nextPage,
    );
  }

  FormInputsList<SocialNetwork,String?> _getFormInputsList(){
    Map<SocialNetwork,FormInput<String?>> inputs = {};
    for(SocialNetwork socialNetwork in SocialNetwork.values){
      inputs.addAll(_getSocialNetworkInputMapEntry(socialNetwork));
    }
    return ExpandedFormInputsList(inputs);
  }

  Future<void> _updateSocialNetworks(Map<SocialNetwork, String?> inputs, BuildContext context) async{
    await Future.forEach(inputs.entries,(entry) async{
      entry.value != null 
      ? await widget._socialNetworkService.updateSocialNetwork(entry.key, entry.value!)
      : await widget._socialNetworkService.removeSocialNetwork(entry.key);
    });
    context.read<AuthenticationProvider>().updateSocialNetowrks(inputs);
  }

  Map<SocialNetwork,FormInput<String?>>_getSocialNetworkInputMapEntry(SocialNetwork socialNetwork){
    return {
      socialNetwork: SocialNetworkInput(
        socialNetwork,    
        initialValue: _authenticationProvider.getUsernameFromSocialNetwork(socialNetwork)
      )
    };
  }

}