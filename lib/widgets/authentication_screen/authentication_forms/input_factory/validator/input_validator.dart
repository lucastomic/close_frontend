import 'package:injectable/injectable.dart';

@Injectable()
class InputValidator{
  String? mandatoryInputValidation(String? value){
    if(value == null || value =="") return "Este campo es obligatorio";
    return null;
  }
  String? minimumLengthValidation(String? value){
    String? mandatoryValidation = mandatoryInputValidation(value);
    if(mandatoryValidation != null) return mandatoryValidation;
    if(value!.length < 6) return "La contraseña debe tener al menos 6 caracteres";
    return null;
  }
}