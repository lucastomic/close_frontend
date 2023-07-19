// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../image_manage/image_picker/image_picker.dart' as _i11;
import '../image_manage/image_picker/image_picker_port.dart' as _i10;
import '../image_manage/image_quality_reducer/cloudinary_image_quality_reducer.dart'
    as _i13;
import '../image_manage/image_quality_reducer/image_quality_reducer.dart'
    as _i12;
import '../image_manage/image_uploader/cloudinary_image_uploader.dart' as _i15;
import '../image_manage/image_uploader/image_uploader_port.dart' as _i14;
import '../services/authentication_service/authentication_service.dart' as _i19;
import '../services/authentication_service/port/authentication_service_port.dart'
    as _i18;
import '../services/close_users/close_users_servic_port.dart' as _i4;
import '../services/close_users/close_users_service.dart' as _i5;
import '../services/message_service/message_service.dart' as _i7;
import '../services/message_service/message_service_port.dart' as _i6;
import '../services/social_network/port/social_network_service_port.dart'
    as _i8;
import '../services/social_network/social_network_service.dart' as _i9;
import '../widgets/authentication_screen/authentication_forms/input_factory/login_input_factory.dart'
    as _i21;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart'
    as _i20;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart'
    as _i22;
import '../widgets/authentication_screen/authentication_forms/input_factory/register_input_factory.dart'
    as _i23;
import '../widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart'
    as _i16;
import '../widgets/router_screen/current_page_provider.dart' as _i3;
import '../widgets/router_screen/router_screen.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i3.CurrentPageProvider>(() => _i3.CurrentPageProvider());
    gh.factory<_i4.ICloseUsersService>(() => _i5.CloseUsersService());
    gh.factory<_i6.IMessageService>(() => _i7.MessageService());
    gh.factory<_i8.ISocialNetworkService>(() => _i9.SocialNetworkService());
    gh.factory<_i10.ImagePickerPort>(() => _i11.ImagePickerImpl());
    gh.factory<_i12.ImageQualityReducer>(
        () => _i13.CloudinaryImageQualityReducer());
    gh.factory<_i14.ImageUploader>(() => _i15.CloudinaryImageUploader());
    gh.factory<_i16.InputValidator>(() => _i16.InputValidator());
    gh.factory<_i17.RouterScreen>(() => _i17.RouterScreen(
          get<_i4.ICloseUsersService>(),
          get<_i12.ImageQualityReducer>(),
          get<_i6.IMessageService>(),
        ));
    gh.factory<_i18.IAuthenticationService>(
        () => _i19.AuthenticationService(get<_i14.ImageUploader>()));
    gh.factory<_i20.ILoginInputFactory>(
        () => _i21.LoginInputFactory(get<_i16.InputValidator>()));
    gh.factory<_i22.IRegisterInputFactory>(() => _i23.RegisterInputFactory(
          get<_i16.InputValidator>(),
          get<_i10.ImagePickerPort>(),
        ));
    return this;
  }
}
