import 'package:close_frontend/domain/social_network/social_network.dart';
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
  final void Function()? _execAfterSubmit;

  const SocialNetowrksForm(
    this._socialNetworkService,
    {
      void Function()? execAfterSubmit //If it's omitted it will Pop to the previous page as default
    }
  ) : _execAfterSubmit = execAfterSubmit;

  @override
  State<SocialNetowrksForm> createState() => _SocialNetowrksFormState();
}

class _SocialNetowrksFormState extends State<SocialNetowrksForm> {
  late final AuthenticationProvider _authenticationProvider;

  @override
  void initState() {
    _initializeAuthenticationProvider();
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

  void _initializeAuthenticationProvider(){
    _authenticationProvider = context.read<AuthenticationProvider>();
  }

  Future<void> _onSubmit(Map<SocialNetwork, String?> inputs)async{
    await _updateSocialNetworks(inputs);
    await _authenticationProvider.refreshUser();
    _execAfterSubmitOrPop();
  }

  FormInputsList<SocialNetwork,String?> _getFormInputsList(){
    Map<SocialNetwork,FormInput<String?>> inputs = {};
    for(SocialNetwork socialNetwork in SocialNetwork.values){
      inputs.addAll(_getSocialNetworkInputMapEntry(socialNetwork));
    }
    return FormInputsList(inputs);
  }

  Future<void> _updateSocialNetworks(Map<SocialNetwork, String?> inputs) async{
    await Future.forEach(inputs.entries,(entry) async{
      entry.value != null ? await widget._socialNetworkService.updateSocialNetwork(entry.key, entry.value!):
      await widget._socialNetworkService.removeSocialNetwork(entry.key);
    });
  }

  Map<SocialNetwork,FormInput<String?>>_getSocialNetworkInputMapEntry(SocialNetwork socialNetwork){
      return {socialNetwork: SocialNetworkInput(
        socialNetwork,    
        initialValue: _authenticationProvider.getUsernameFromSocialNetwork(socialNetwork)
      )};
  }

  void _execAfterSubmitOrPop(){
    widget._execAfterSubmit!= null ? widget._execAfterSubmit!() : Navigator.of(context).pop();

  }
}