import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_input/social_network_input.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_screen_header.dart';
import 'package:flutter/material.dart';

class SocialNetworksScreen extends StatelessWidget {
  const SocialNetworksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SocialNetworksScreenHeader(), 
            Expanded(
              child: CustomForm(
                inputs: FormInputsList({
                  "instagram":SocialNetworkInput(SocialNetwork("INSTAGRAM")),
                  "twitter":SocialNetworkInput(SocialNetwork("TWITTER")),
                  "tiktok":SocialNetworkInput(SocialNetwork("TIKTOK")),
                }),
                submitButtonText: "Guardar",
                onSubmit:(Map<String,String> values)async{},
              ),
            ),
          ],
        ),
      )
    );
  }
}
