// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../image_manage/image_picker/image_picker.dart' as _i13;
import '../image_manage/image_picker/image_picker_port.dart' as _i12;
import '../image_manage/image_quality_reducer/cloudinary_image_quality_reducer.dart'
    as _i15;
import '../image_manage/image_quality_reducer/image_quality_reducer.dart'
    as _i14;
import '../image_manage/image_uploader/cloudinary_image_uploader.dart' as _i17;
import '../image_manage/image_uploader/image_uploader_port.dart' as _i16;
import '../services/authentication_service/authentication_service.dart' as _i20;
import '../services/authentication_service/port/authentication_service_port.dart'
    as _i19;
import '../services/chat_service/chat_service.dart' as _i22;
import '../services/chat_service/chat_service_port.dart' as _i21;
import '../services/chat_service/chat_stream_service/chat_stream_service.dart'
    as _i5;
import '../services/chat_service/chat_stream_service/chat_stream_service_port.dart'
    as _i4;
import '../services/close_users/close_users_servic_port.dart' as _i6;
import '../services/close_users/close_users_service.dart' as _i7;
import '../services/interests_service/interest_service.dart' as _i9;
import '../services/interests_service/interest_service_port.dart' as _i8;
import '../services/social_network/port/social_network_service_port.dart'
    as _i10;
import '../services/social_network/social_network_service.dart' as _i11;
import '../widgets/authentication_screen/authentication_forms/input_factory/login_input_factory.dart'
    as _i24;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart'
    as _i23;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart'
    as _i25;
import '../widgets/authentication_screen/authentication_forms/input_factory/register_input_factory.dart'
    as _i26;
import '../widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart'
    as _i18;
import '../widgets/router_screen/current_page_provider.dart' as _i3;
import '../widgets/router_screen/router_screen.dart'
    as _i27; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i4.IChatStreamService>(() => _i5.ChatStreamService());
    gh.factory<_i6.ICloseUsersService>(() => _i7.CloseUsersService());
    gh.factory<_i8.IInterestService>(() => _i9.InterestsService());
    gh.factory<_i10.ISocialNetworkService>(() => _i11.SocialNetworkService());
    gh.factory<_i12.ImagePickerPort>(() => _i13.ImagePickerImpl());
    gh.factory<_i14.ImageQualityReducer>(
        () => _i15.CloudinaryImageQualityReducer());
    gh.factory<_i16.ImageUploader>(() => _i17.CloudinaryImageUploader());
    gh.factory<_i18.InputValidator>(() => _i18.InputValidator());
    gh.factory<_i19.IAuthenticationService>(
        () => _i20.AuthenticationService(get<_i16.ImageUploader>()));
    gh.factory<_i21.IChatService>(
        () => _i22.ChatService(get<_i4.IChatStreamService>()));
    gh.factory<_i23.ILoginInputFactory>(
        () => _i24.LoginInputFactory(get<_i18.InputValidator>()));
    gh.factory<_i25.IRegisterInputFactory>(() => _i26.RegisterInputFactory(
          get<_i18.InputValidator>(),
          get<_i12.ImagePickerPort>(),
        ));
    gh.factory<_i27.RouterScreen>(() => _i27.RouterScreen(
          get<_i6.ICloseUsersService>(),
          get<_i14.ImageQualityReducer>(),
          get<_i21.IChatService>(),
        ));
    return this;
  }
}
