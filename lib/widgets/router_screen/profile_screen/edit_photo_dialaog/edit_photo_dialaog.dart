import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/profile_photo/profile_photo_service_port.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:close_frontend/widgets/forms/inputs/photo_selector_input/photo_selector_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../image_manage/image_picker/image_picker_port.dart';

class EditPhotoDialog extends StatelessWidget {
  final ImagePickerPort _imagePicker;
  final IProfilePhotoService _photoService;
  EditPhotoDialog(this._imagePicker,this._photoService);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child:Column(
          children: [
            EditPhotoForm(_imagePicker,_photoService)
          ],
        )
      ),
    );
  }
}

class EditPhotoForm extends StatelessWidget { 
  final ImagePickerPort _imagePicker;
  final IProfilePhotoService _photoService;
  const EditPhotoForm(this._imagePicker,this._photoService);
  @override
  Widget build(BuildContext context) {
    return CustomForm<String,String>(
      submitButtonText: "Guardar",
      inputs: _getInputs(),
      onSubmit: (inputs)=>_onSubmit(inputs,context),
    );
  }

  Future<void> _onSubmit(Map<String,String> inputs,BuildContext context)async{
    String url = await _photoService.modify(inputs["path"]!);
    context.read<AuthenticationProvider>().setPhoto(url);
    Navigator.of(context).pop();
  } 

  FormInputsList<String,String> _getInputs(){
    return FormInputsList({
        "path":PhotoInputSelctor(_imagePicker)
    });
  }
}