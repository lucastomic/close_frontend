// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../image_manage/image_picker/image_picker.dart' as _i8;
import '../image_manage/image_picker/image_picker_port.dart' as _i7;
import '../image_manage/image_uplodaer/image_uploader.dart' as _i10;
import '../image_manage/image_uplodaer/image_uploader_port.dart' as _i9;
import '../services/authentication_service/authentication_service.dart' as _i13;
import '../services/authentication_service/port/authentication_service_port.dart'
    as _i12;
import '../services/close_users/close_users_servic_port.dart' as _i3;
import '../services/close_users/close_users_service.dart' as _i4;
import '../services/social_network/port/social_network_service_port.dart'
    as _i5;
import '../services/social_network/social_network_service.dart' as _i6;
import '../widgets/authentication_screen/authentication_forms/input_factory/login_input_factory.dart'
    as _i15;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart'
    as _i14;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart'
    as _i16;
import '../widgets/authentication_screen/authentication_forms/input_factory/register_input_factory.dart'
    as _i17;
import '../widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ICloseUsersService>(() => _i4.CloseUsersService());
    gh.factory<_i5.ISocialNetworkService>(() => _i6.SocialNetworkService());
    gh.factory<_i7.ImagePickerPort>(() => _i8.ImagePickerImpl());
    gh.factory<_i9.ImageUploaderPort>(() => _i10.ImageUploader());
    gh.factory<_i11.InputValidator>(() => _i11.InputValidator());
    gh.factory<_i12.IAuthenticationService>(
        () => _i13.AuthenticationService(get<_i9.ImageUploaderPort>()));
    gh.factory<_i14.ILoginInputFactory>(
        () => _i15.LoginInputFactory(get<_i11.InputValidator>()));
    gh.factory<_i16.IRegisterInputFactory>(() => _i17.RegisterInputFactory(
          get<_i11.InputValidator>(),
          get<_i7.ImagePickerPort>(),
        ));
    return this;
  }
}
