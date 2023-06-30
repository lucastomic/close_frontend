// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../widgets/authentication_screen/authentication_forms/customized_input/factory/login_input_factory.dart'
    as _i5;
import '../widgets/authentication_screen/authentication_forms/customized_input/factory/ports/login_input_factory_port.dart'
    as _i4;
import '../widgets/authentication_screen/authentication_forms/customized_input/factory/ports/register_input_factory_port.dart'
    as _i6;
import '../widgets/authentication_screen/authentication_forms/customized_input/factory/register_input_factory.dart'
    as _i7;
import '../widgets/authentication_screen/authentication_forms/customized_input/factory/validator/input_validator.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i3.InputValidator>(() => _i3.InputValidator());
    gh.factory<_i4.ILoginInputFactory>(
        () => _i5.LoginInputFactory(get<_i3.InputValidator>()));
    gh.factory<_i6.IRegisterInputFactory>(
        () => _i7.RegisterInputFactory(get<_i3.InputValidator>()));
    return this;
  }
}
