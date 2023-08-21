// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../image_manage/image_picker/image_picker.dart' as _i17;
import '../image_manage/image_picker/image_picker_port.dart' as _i16;
import '../image_manage/image_quality_reducer/cloudinary_image_quality_reducer.dart'
    as _i19;
import '../image_manage/image_quality_reducer/image_quality_reducer.dart'
    as _i18;
import '../image_manage/image_uploader/cloudinary_image_uploader.dart' as _i21;
import '../image_manage/image_uploader/image_uploader_port.dart' as _i20;
import '../local_storage/local_storage.dart' as _i5;
import '../local_storage/local_storage_port.dart' as _i4;
import '../services/authentication_service/authentication_service.dart' as _i24;
import '../services/authentication_service/port/authentication_service_port.dart'
    as _i23;
import '../services/chat_service/chat_service.dart' as _i26;
import '../services/chat_service/chat_service_port.dart' as _i25;
import '../services/chat_service/chat_stream_service/chat_stream_service.dart'
    as _i7;
import '../services/chat_service/chat_stream_service/chat_stream_service_port.dart'
    as _i6;
import '../services/close_users/close_users_servic_port.dart' as _i8;
import '../services/close_users/close_users_service.dart' as _i9;
import '../services/interests_service/interest_service.dart' as _i11;
import '../services/interests_service/interest_service_port.dart' as _i10;
import '../services/location/location_service.dart' as _i13;
import '../services/location/location_service_port.dart' as _i12;
import '../services/social_network/port/social_network_service_port.dart'
    as _i14;
import '../services/social_network/social_network_service.dart' as _i15;
import '../widgets/authentication_screen/authentication_forms/input_factory/login_input_factory.dart'
    as _i30;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart'
    as _i29;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart'
    as _i31;
import '../widgets/authentication_screen/authentication_forms/input_factory/register_input_factory.dart'
    as _i32;
import '../widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart'
    as _i22;
import '../widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart'
    as _i27;
import '../widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checkers_manager.dart'
    as _i28;
import '../widgets/router_screen/current_page_provider.dart' as _i3;
import '../widgets/router_screen/router_screen.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i4.IAuthenticationLocalStorage>(
        () => _i5.AuthenticationLocalStorage());
    gh.factory<_i6.IChatStreamService>(() => _i7.ChatStreamService());
    gh.factory<_i8.ICloseUsersService>(() => _i9.CloseUsersService());
    gh.factory<_i10.IInterestService>(() => _i11.InterestsService());
    gh.factory<_i12.ILocationService>(() => _i13.LocationService());
    gh.factory<_i14.ISocialNetworkService>(() => _i15.SocialNetworkService());
    gh.factory<_i16.ImagePickerPort>(() => _i17.ImagePickerImpl());
    gh.factory<_i18.ImageQualityReducer>(
        () => _i19.CloudinaryImageQualityReducer());
    gh.factory<_i20.ImageUploader>(() => _i21.CloudinaryImageUploader());
    gh.factory<_i22.InputValidator>(() => _i22.InputValidator());
    gh.factory<_i23.IAuthenticationService>(
        () => _i24.AuthenticationService(get<_i20.ImageUploader>()));
    gh.factory<_i25.IChatService>(
        () => _i26.ChatService(get<_i6.IChatStreamService>()));
    gh.factory<_i27.IInterestCheckerManager>(
        () => _i28.InterestCheckerBoxManager(get<_i10.IInterestService>()));
    gh.factory<_i29.ILoginInputFactory>(
        () => _i30.LoginInputFactory(get<_i22.InputValidator>()));
    gh.factory<_i31.IRegisterInputFactory>(() => _i32.RegisterInputFactory(
          get<_i22.InputValidator>(),
          get<_i16.ImagePickerPort>(),
        ));
    gh.factory<_i33.RouterScreen>(() => _i33.RouterScreen(
          get<_i8.ICloseUsersService>(),
          get<_i18.ImageQualityReducer>(),
          get<_i25.IChatService>(),
        ));
    return this;
  }
}
