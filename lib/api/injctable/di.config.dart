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
import '../../data/data_sources/remote/health_journal/health_journal_data_sources.dart'
    as _i1045;
import '../../data/data_sources/remote/home_tab/home_tab_data_sources.dart'
    as _i388;
import '../../data/data_sources/remote/medical_history/medical_history_data_sources.dart'
    as _i880;
import '../../data/data_sources/remote/medical_identity/medical_identity_data_sources.dart'
    as _i927;
import '../../data/data_sources/remote/notification/notificatin_data_source.dart'
    as _i1029;
import '../../data/data_sources/remote/permission_token/permission_token_data_sources.dart'
    as _i32;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/health_journal/health_journal_repository_impl.dart'
    as _i1058;
import '../../data/repositories/home_tab/home_tab_repository_impl.dart'
    as _i154;
import '../../data/repositories/medical_history/medical_history_repository_impl.dart'
    as _i792;
import '../../data/repositories/medical_identity/medical_identity_repository_impl.dart'
    as _i846;
import '../../data/repositories/notificatin/ntification_repository_impl.dart'
    as _i175;
import '../../data/repositories/permission_token/permission_token_repository_impl.dart'
    as _i324;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/health_journal/health_journal_repository.dart'
    as _i1022;
import '../../domain/repositories/home_tab/home_tab_repository.dart' as _i469;
import '../../domain/repositories/medical_history/medical_history_repository.dart'
    as _i287;
import '../../domain/repositories/medical_identity/medical_identity_repository.dart'
    as _i243;
import '../../domain/repositories/notification/notification_repository.dart'
    as _i87;
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
import '../../domain/use_cases/health_journal/get_health_journal_diagonse_use_case.dart'
    as _i244;
import '../../domain/use_cases/health_journal/get_health_journal_notes_diagonse_id_use_case.dart'
    as _i539;
import '../../domain/use_cases/health_journal/get_health_journal_notes_use_case.dart'
    as _i885;
import '../../domain/use_cases/health_journal/health_journal_notes_use_case.dart'
    as _i482;
import '../../domain/use_cases/home_tab/home_reminder_counters_use_case.dart'
    as _i905;
import '../../domain/use_cases/medical_history/get_list_medical_history_use_case.dart'
    as _i59;
import '../../domain/use_cases/medical_history/get_medical_history_use_case.dart'
    as _i474;
import '../../domain/use_cases/medical_identity/add_emergency_contact_use_case.dart'
    as _i597;
import '../../domain/use_cases/medical_identity/delete_emergency_contact_use_case.dart'
    as _i590;
import '../../domain/use_cases/medical_identity/get_medical_identity_use_case.dart'
    as _i315;
import '../../domain/use_cases/medical_identity/get_profile_image_use_case.dart'
    as _i913;
import '../../domain/use_cases/medical_identity/upload_profile_image_use_case.dart'
    as _i238;
import '../../domain/use_cases/notification/list_active_patient_reminders_use_case.dart'
    as _i844;
import '../../domain/use_cases/notification/list_all_patient_notification_use_case.dart'
    as _i172;
import '../../domain/use_cases/notification/notification_read_use_case.dart'
    as _i406;
import '../../domain/use_cases/notification/peanding_notification_use_case.dart'
    as _i945;
import '../../domain/use_cases/notification/update_patient_reminders_use_case.dart'
    as _i841;
import '../../domain/use_cases/permission_token/generate_permission_token/generate_permission_token_use_case.dart'
    as _i535;
import '../../domain/use_cases/permission_token/get_permission_token/get_permission_token_use_case.dart'
    as _i690;
import '../../domain/use_cases/permission_token/permission_token_revoke/permission_token_revoke_use_case.dart'
    as _i90;
import '../../features/auth/cubit/auth_cubit.dart' as _i698;
import '../../features/home/cubit/home_cubit.dart' as _i1032;
import '../../features/onboarding/cubit/onboarding_cubit.dart' as _i547;
import '../../features/tabs/health_journal/cubit/health_journal_cubit.dart'
    as _i407;
import '../../features/tabs/home_tab/cubit/home_tab_cubt.dart' as _i348;
import '../../features/tabs/home_tab/cubit/notification_cubit.dart' as _i332;
import '../../features/tabs/home_tab/cubit/permission_token_cubit.dart'
    as _i182;
import '../../features/tabs/medical_history/cubit/medical_history_cubit.dart'
    as _i554;
import '../../features/tabs/medical_identiti/cubit/medical_identity_cubit.dart'
    as _i495;
import '../data_sources/remote/auth/auth_data_sources_impl.dart' as _i62;
import '../data_sources/remote/health_journal/health_journal_data_sources_impl.dart'
    as _i496;
import '../data_sources/remote/home_tab/home_tab_data_sources_impl.dart'
    as _i994;
import '../data_sources/remote/medical_history/medical_history_data_sources_impl.dart'
    as _i238;
import '../data_sources/remote/medical_identity/medical_identity_data_sources_impl.dart'
    as _i333;
import '../data_sources/remote/notification/notifiation_data_sources_impl.dart'
    as _i338;
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
    gh.factory<_i547.OnboardingCubit>(() => _i547.OnboardingCubit());
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
    gh.factory<_i1029.NotificationDataSource>(
      () =>
          _i338.NotifiationDataSourcesImpl(webService: gh<_i410.WebService>()),
    );
    gh.factory<_i927.MedicalIdentityDataSources>(
      () => _i333.MedicalIdentityDataSourcesImpl(
        webservice: gh<_i410.WebService>(),
      ),
    );
    gh.factory<_i87.NotificationRepository>(
      () => _i175.NotificationRepositoryImpl(
        notificationDataSource: gh<_i1029.NotificationDataSource>(),
      ),
    );
    gh.factory<_i388.HomeTabDataSources>(
      () => _i994.HomeTabDataSourcesImpl(webService: gh<_i410.WebService>()),
    );
    gh.factory<_i697.AuthDataSources>(
      () => _i62.AuthDataSourcesImpl(webService: gh<_i410.WebService>()),
    );
    gh.factory<_i880.MedicalHistoryDataSources>(
      () => _i238.MedicalHistoryDataSourcesImpl(
        webService: gh<_i410.WebService>(),
      ),
    );
    gh.factory<_i32.PermissionTokenDataSources>(
      () => _i39.PermissionTokenDataSourcesImpl(
        webService: gh<_i410.WebService>(),
      ),
    );
    gh.factory<_i1045.HealthJournalDataSources>(
      () => _i496.HealthJournalDataSourcesImpl(
        webService: gh<_i410.WebService>(),
      ),
    );
    gh.factory<_i243.MedicalIdentityRepository>(
      () => _i846.MedicalIdentityRepositoryImpl(
        medicalIdentityDataSources: gh<_i927.MedicalIdentityDataSources>(),
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
    gh.factory<_i1022.HealthJournalRepository>(
      () => _i1058.HealthJournalRepositoryImpl(
        healthJournalDataSources: gh<_i1045.HealthJournalDataSources>(),
      ),
    );
    gh.factory<_i844.ListActivePatientRemindersUseCase>(
      () => _i844.ListActivePatientRemindersUseCase(
        notificationRepository: gh<_i87.NotificationRepository>(),
      ),
    );
    gh.factory<_i172.ListAllPatientNotificationUseCase>(
      () => _i172.ListAllPatientNotificationUseCase(
        notificationRepository: gh<_i87.NotificationRepository>(),
      ),
    );
    gh.factory<_i406.NotificationReadUseCase>(
      () => _i406.NotificationReadUseCase(
        notificationRepository: gh<_i87.NotificationRepository>(),
      ),
    );
    gh.factory<_i945.PeandingNotificationUseCase>(
      () => _i945.PeandingNotificationUseCase(
        notificationRepository: gh<_i87.NotificationRepository>(),
      ),
    );
    gh.factory<_i841.UpdatePatientRemindersUseCase>(
      () => _i841.UpdatePatientRemindersUseCase(
        notificationRepository: gh<_i87.NotificationRepository>(),
      ),
    );
    gh.factory<_i287.MedicalHistoryRepository>(
      () => _i792.MedicalHistoryRepositoryImpl(
        medicalHistoryDataSources: gh<_i880.MedicalHistoryDataSources>(),
      ),
    );
    gh.factory<_i469.HomeTabRepository>(
      () => _i154.HomeTabRepositoryImpl(
        homeTabDataSources: gh<_i388.HomeTabDataSources>(),
      ),
    );
    gh.factory<_i597.AddEmergencyContactUseCase>(
      () => _i597.AddEmergencyContactUseCase(
        medicalIdentityRepository: gh<_i243.MedicalIdentityRepository>(),
      ),
    );
    gh.factory<_i590.DeleteEmergencyContactUseCase>(
      () => _i590.DeleteEmergencyContactUseCase(
        medicalIdentityRepository: gh<_i243.MedicalIdentityRepository>(),
      ),
    );
    gh.factory<_i315.GetMedicalIdentityUseCase>(
      () => _i315.GetMedicalIdentityUseCase(
        medicalIdentityRepository: gh<_i243.MedicalIdentityRepository>(),
      ),
    );
    gh.factory<_i913.GetProfileImageUseCase>(
      () => _i913.GetProfileImageUseCase(
        medicalIdentityRepository: gh<_i243.MedicalIdentityRepository>(),
      ),
    );
    gh.factory<_i238.UploadProfileImageUseCase>(
      () => _i238.UploadProfileImageUseCase(
        medicalIdentityRepository: gh<_i243.MedicalIdentityRepository>(),
      ),
    );
    gh.factory<_i905.HomeReminderCountersUseCase>(
      () => _i905.HomeReminderCountersUseCase(
        homeTabRepository: gh<_i469.HomeTabRepository>(),
      ),
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
    gh.factory<_i244.GetHealthJournalDiagonseUseCase>(
      () => _i244.GetHealthJournalDiagonseUseCase(
        healthJournalRepository: gh<_i1022.HealthJournalRepository>(),
      ),
    );
    gh.factory<_i539.GetHealthJournalNotesDiagonseIdUseCase>(
      () => _i539.GetHealthJournalNotesDiagonseIdUseCase(
        healthJournalRepository: gh<_i1022.HealthJournalRepository>(),
      ),
    );
    gh.factory<_i885.GetHealthJournalNotesUseCase>(
      () => _i885.GetHealthJournalNotesUseCase(
        healthJournalRepository: gh<_i1022.HealthJournalRepository>(),
      ),
    );
    gh.factory<_i482.HealthJournalNotesUseCase>(
      () => _i482.HealthJournalNotesUseCase(
        healthJournalRepository: gh<_i1022.HealthJournalRepository>(),
      ),
    );
    gh.factory<_i495.MedicalIdentityCubit>(
      () => _i495.MedicalIdentityCubit(
        uploadProfileImageUseCase: gh<_i238.UploadProfileImageUseCase>(),
        getProfileImageUseCase: gh<_i913.GetProfileImageUseCase>(),
        addEmergencyContactUseCase: gh<_i597.AddEmergencyContactUseCase>(),
        getMedicalIdentityUseCase: gh<_i315.GetMedicalIdentityUseCase>(),
        deleteEmergencyContactUseCase:
            gh<_i590.DeleteEmergencyContactUseCase>(),
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
    gh.lazySingleton<_i332.NotificationCubit>(
      () => _i332.NotificationCubit(
        listAllPatientNotificationUseCase:
            gh<_i172.ListAllPatientNotificationUseCase>(),
        notificationReadUseCase: gh<_i406.NotificationReadUseCase>(),
        listActivePatientRemindersUseCase:
            gh<_i844.ListActivePatientRemindersUseCase>(),
        peandingNotificationUseCase: gh<_i945.PeandingNotificationUseCase>(),
        updatePatientRemindersUseCase:
            gh<_i841.UpdatePatientRemindersUseCase>(),
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
    gh.factory<_i59.GetListMedicalHistoryUseCase>(
      () => _i59.GetListMedicalHistoryUseCase(
        medicalHistoryRepository: gh<_i287.MedicalHistoryRepository>(),
      ),
    );
    gh.factory<_i474.GetMedicalHistoryUseCase>(
      () => _i474.GetMedicalHistoryUseCase(
        medicalHistoryRepository: gh<_i287.MedicalHistoryRepository>(),
      ),
    );
    gh.factory<_i348.HomeTabCubt>(
      () => _i348.HomeTabCubt(
        homeReminderCountersUseCase: gh<_i905.HomeReminderCountersUseCase>(),
      ),
    );
    gh.factory<_i407.HealthJournalCubit>(
      () => _i407.HealthJournalCubit(
        getHealthJournalDiagonseUseCase:
            gh<_i244.GetHealthJournalDiagonseUseCase>(),
        healthJournalNotesUseCase: gh<_i482.HealthJournalNotesUseCase>(),
        getHealthJournalNotesUseCase: gh<_i885.GetHealthJournalNotesUseCase>(),
        getHealthJournalNotesDiagonseIdUseCase:
            gh<_i539.GetHealthJournalNotesDiagonseIdUseCase>(),
      ),
    );
    gh.factory<_i1032.HomeCubit>(
      () => _i1032.HomeCubit(notificationCubit: gh<_i332.NotificationCubit>()),
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
    gh.factory<_i554.MedicalHistoryCubit>(
      () => _i554.MedicalHistoryCubit(
        getListMedicalHistoryUseCase: gh<_i59.GetListMedicalHistoryUseCase>(),
        getMedicalHistoryUseCase: gh<_i474.GetMedicalHistoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i322.DioModule {}
