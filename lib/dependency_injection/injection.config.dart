// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../image_manage/image_picker/image_picker.dart' as _i18;
import '../image_manage/image_picker/image_picker_port.dart' as _i17;
import '../image_manage/image_quality_reducer/cloudinary_image_quality_reducer.dart'
    as _i20;
import '../image_manage/image_quality_reducer/image_quality_reducer.dart'
    as _i19;
import '../image_manage/image_uploader/cloudinary_image_uploader.dart' as _i22;
import '../image_manage/image_uploader/image_uploader_port.dart' as _i21;
import '../local_storage/local_storage.dart' as _i4;
import '../local_storage/local_storage_port.dart' as _i3;
import '../services/authentication_service/authentication_service.dart' as _i40;
import '../services/authentication_service/port/authentication_service_port.dart'
    as _i39;
import '../services/chat_service/chat_service.dart' as _i25;
import '../services/chat_service/chat_service_port.dart' as _i24;
import '../services/chat_service/chat_stream_service/chat_stream_service.dart'
    as _i6;
import '../services/chat_service/chat_stream_service/chat_stream_service_port.dart'
    as _i5;
import '../services/close_users/close_users_servic_port.dart' as _i7;
import '../services/close_users/close_users_service.dart' as _i8;
import '../services/duck_service/duck_service.dart' as _i27;
import '../services/duck_service/duck_service_port.dart' as _i26;
import '../services/duck_service/duck_stream_service/duck_stream_service.dart'
    as _i10;
import '../services/duck_service/duck_stream_service/duck_stream_service_port.dart'
    as _i9;
import '../services/interests_service/interest_service.dart' as _i12;
import '../services/interests_service/interest_service_port.dart' as _i11;
import '../services/location/location_service.dart' as _i14;
import '../services/location/location_service_port.dart' as _i13;
import '../services/notifications_service/firebase_notification_service.dart'
    as _i37;
import '../services/notifications_service/notification_service.dart' as _i36;
import '../services/profile_photo/profile_photo_service.dart' as _i33;
import '../services/profile_photo/profile_photo_service_port.dart' as _i32;
import '../services/social_network/port/social_network_service_port.dart'
    as _i15;
import '../services/social_network/social_network_service.dart' as _i16;
import '../widgets/authentication_screen/authentication_forms/input_factory/login_input_factory.dart'
    as _i31;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/login_input_factory_port.dart'
    as _i30;
import '../widgets/authentication_screen/authentication_forms/input_factory/ports/register_input_factory_port.dart'
    as _i34;
import '../widgets/authentication_screen/authentication_forms/input_factory/register_input_factory.dart'
    as _i35;
import '../widgets/authentication_screen/authentication_forms/input_factory/validator/input_validator.dart'
    as _i23;
import '../widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checker_manager_port.dart'
    as _i28;
import '../widgets/interests_screen/interest_selction_form/interest_checkers_manager/interest_checkers_manager.dart'
    as _i29;
import '../widgets/router_screen/router_screen.dart'
    as _i38; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i3.IAuthenticationLocalStorage>(
        () => _i4.AuthenticationLocalStorage());
    gh.factory<_i5.IChatStreamService>(() => _i6.ChatStreamService());
    gh.factory<_i7.ICloseUsersService>(() => _i8.CloseUsersService());
    gh.factory<_i9.IDuckStreamService>(() => _i10.DuckStreamService());
    gh.factory<_i11.IInterestService>(() => _i12.InterestsService());
    gh.factory<_i13.ILocationService>(() => _i14.LocationService());
    gh.factory<_i15.ISocialNetworkService>(() => _i16.SocialNetworkService());
    gh.factory<_i17.ImagePickerPort>(() => _i18.ImagePickerImpl());
    gh.factory<_i19.ImageQualityReducer>(
        () => _i20.CloudinaryImageQualityReducer());
    gh.factory<_i21.ImageUploader>(() => _i22.CloudinaryImageUploader());
    gh.factory<_i23.InputValidator>(() => _i23.InputValidator());
    gh.factory<_i24.IChatService>(
        () => _i25.ChatService(get<_i5.IChatStreamService>()));
    gh.factory<_i26.IDuckService>(
        () => _i27.DuckService(get<_i9.IDuckStreamService>()));
    gh.factory<_i28.IInterestCheckerManager>(
        () => _i29.InterestCheckerBoxManager(get<_i11.IInterestService>()));
    gh.factory<_i30.ILoginInputFactory>(
        () => _i31.LoginInputFactory(get<_i23.InputValidator>()));
    gh.factory<_i32.IProfilePhotoService>(
        () => _i33.ProfilePhotoService(get<_i21.ImageUploader>()));
    gh.factory<_i34.IRegisterInputFactory>(() => _i35.RegisterInputFactory(
          get<_i23.InputValidator>(),
          get<_i17.ImagePickerPort>(),
        ));
    gh.factory<_i36.NotificationService>(
        () => _i37.FirebaseNotificationService(get<_i24.IChatService>()));
    gh.factory<_i38.RouterScreen>(() => _i38.RouterScreen(
          get<_i7.ICloseUsersService>(),
          get<_i19.ImageQualityReducer>(),
          get<_i24.IChatService>(),
          get<_i26.IDuckService>(),
          get<_i17.ImagePickerPort>(),
          get<_i32.IProfilePhotoService>(),
        ));
    gh.factory<_i39.IAuthenticationService>(() => _i40.AuthenticationService(
          get<_i21.ImageUploader>(),
          get<_i36.NotificationService>(),
        ));
    return this;
  }
}
