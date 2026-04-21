// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/data_sources/remote/auth/auth_data_sources.dart' as _i697;
import '../../data/data_sources/remote/permission_token/permission_token_data_sources.dart'
    as _i32;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/permission_token/permission_token_repository_impl.dart'
    as _i324;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/permission_token/permission_token_repository.dart'
    as _i241;
import '../../domain/use_cases/auth/login/login_resend_otp_use_case.dart'
    as _i553;
import '../../domain/use_cases/auth/login/login_use_case.dart' as _i396;
import '../../domain/use_cases/auth/login/login_verify_otp_use_case.dart'
    as _i255;
import '../../domain/use_cases/auth/password_reset/password_reset_confirm_use_case.dart'
    as _i846;
import '../../domain/use_cases/auth/password_reset/password_reset_resend_otp_use_case.dart'
    as _i355;
import '../../domain/use_cases/auth/password_reset/password_reset_use_case.dart'
    as _i801;
import '../../domain/use_cases/auth/register/register_resend_otp_use_case.dart'
    as _i245;
import '../../domain/use_cases/auth/register/register_use_case.dart' as _i350;
import '../../domain/use_cases/auth/register/register_verify_otp_use_case.dart'
    as _i757;
import '../../domain/use_cases/permission_token/generate_permission_token/generate_permission_token_use_case.dart'
    as _i535;
import '../../domain/use_cases/permission_token/get_permission_token/get_permission_token_use_case.dart'
    as _i690;
import '../../domain/use_cases/permission_token/permission_token_revoke/permission_token_revoke_use_case.dart'
    as _i90;
import '../../features/auth/cubit/auth_cubit.dart' as _i698;
import '../../features/home/cubit/home_cubit.dart' as _i1032;
import '../../features/onboarding/cubit/onboarding_cubit.dart' as _i547;
import '../../features/tabs/home_tab/cubit/home_tab_cubt.dart' as _i348;
import '../../features/tabs/home_tab/cubit/permission_token_cubit.dart'
    as _i182;
import '../../features/tabs/medical_identiti/cubit/medical_identity_cubit.dart'
    as _i495;
import '../data_sources/remote/auth/auth_data_sources_impl.dart' as _i62;
import '../data_sources/remote/permission_token/permission_token_data_sources_impl.dart'
    as _i39;
import '../dio/dio_medule.dart' as _i322;
import '../web_service.dart' as _i410;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i1032.HomeCubit>(() => _i1032.HomeCubit());
    gh.factory<_i547.OnboardingCubit>(() => _i547.OnboardingCubit());
    gh.factory<_i348.HomeTabCubt>(() => _i348.HomeTabCubt());
    gh.factory<_i495.MedicalIdentityCubit>(() => _i495.MedicalIdentityCubit());
    gh.lazySingleton<_i361.BaseOptions>(() => dioModule.provideBaseOptions());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.provideRefreshDio(gh<_i361.BaseOptions>()),
      instanceName: 'refreshDio',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
        gh<_i361.Dio>(instanceName: 'refreshDio'),
      ),
      instanceName: 'mainDio',
    );
    gh.lazySingleton<_i410.WebService>(
      () => dioModule.provideWebService(gh<_i361.Dio>(instanceName: 'mainDio')),
    );
    gh.factory<_i697.AuthDataSources>(
      () => _i62.AuthDataSourcesImpl(webService: gh<_i410.WebService>()),
    );
    gh.factory<_i32.PermissionTokenDataSources>(
      () => _i39.PermissionTokenDataSourcesImpl(
        webService: gh<_i410.WebService>(),
      ),
    );
    gh.factory<_i241.PermissionTokenRepository>(
      () => _i324.PermissionTokenRepositoryImpl(
        permissionTokenDataSources: gh<_i32.PermissionTokenDataSources>(),
      ),
    );
    gh.factory<_i660.AuthRepository>(
      () =>
          _i24.AuthRepositoryImpl(authDataSources: gh<_i697.AuthDataSources>()),
    );
    gh.factory<_i535.GeneratePermissionTokenUseCase>(
      () => _i535.GeneratePermissionTokenUseCase(
        permissionTokenRepository: gh<_i241.PermissionTokenRepository>(),
      ),
    );
    gh.factory<_i690.GetPermissionTokenUseCase>(
      () => _i690.GetPermissionTokenUseCase(
        permissionTokenRepository: gh<_i241.PermissionTokenRepository>(),
      ),
    );
    gh.factory<_i90.PermissionTokenRevokeUseCase>(
      () => _i90.PermissionTokenRevokeUseCase(
        permissionTokenRepository: gh<_i241.PermissionTokenRepository>(),
      ),
    );
    gh.factory<_i182.PermissionTokenCubit>(
      () => _i182.PermissionTokenCubit(
        generatePermissionTokenUseCase:
            gh<_i535.GeneratePermissionTokenUseCase>(),
        getPermissionTokenUseCase: gh<_i690.GetPermissionTokenUseCase>(),
        permissionTokenRevokeUseCase: gh<_i90.PermissionTokenRevokeUseCase>(),
      ),
    );
    gh.factory<_i553.LoginResendOtpUseCase>(
      () => _i553.LoginResendOtpUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i396.LoginUseCase>(
      () => _i396.LoginUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i255.LoginVerifyOtpUseCase>(
      () => _i255.LoginVerifyOtpUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i846.PasswordResetConfirmUseCase>(
      () => _i846.PasswordResetConfirmUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i355.PasswordResetResendOtpUseCase>(
      () => _i355.PasswordResetResendOtpUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i801.PasswordResetUseCase>(
      () => _i801.PasswordResetUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i245.RegisterResendOtpUseCase>(
      () => _i245.RegisterResendOtpUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i350.RegisterUseCase>(
      () => _i350.RegisterUseCase(authRepository: gh<_i660.AuthRepository>()),
    );
    gh.factory<_i757.RegisterVerifyOtpUseCase>(
      () => _i757.RegisterVerifyOtpUseCase(
        authRepository: gh<_i660.AuthRepository>(),
      ),
    );
    gh.factory<_i698.AuthCubit>(
      () => _i698.AuthCubit(
        registerUseCase: gh<_i350.RegisterUseCase>(),
        registerResendOtpUseCase: gh<_i245.RegisterResendOtpUseCase>(),
        registerVerifyOtpUseCase: gh<_i757.RegisterVerifyOtpUseCase>(),
        loginUseCase: gh<_i396.LoginUseCase>(),
        loginResendOtpUseCase: gh<_i553.LoginResendOtpUseCase>(),
        loginVerifyOtpUseCase: gh<_i255.LoginVerifyOtpUseCase>(),
        passwordResetUseCase: gh<_i801.PasswordResetUseCase>(),
        passwordResetResendOtpUseCase:
            gh<_i355.PasswordResetResendOtpUseCase>(),
        passwordResetConfirmUseCase: gh<_i846.PasswordResetConfirmUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i322.DioModule {}
