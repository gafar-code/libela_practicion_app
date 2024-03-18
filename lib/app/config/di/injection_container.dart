import 'package:get_it/get_it.dart';
import 'package:libela_practition/app/core/network/dio_client.dart';
import 'package:libela_practition/app/features/auth/data/data_sources/auth_remote_data_sources_impl.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/change_phone_forgot.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/forgot_phone_number.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_cities.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_profession.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_provinces.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_service_area.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_specialization.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/register_verify_otp.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_document_data.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_email_data.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_personal_data.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_profession_data.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/update_service_area.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/change_phone.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/change_phone_verify.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/update_email.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/update_profile.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/upload_image.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/verify_forgot_phone.dart';
import 'package:libela_practition/app/features/home/domain/usecase/get_pending_appointment.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/get_user_profile.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/accept_appointment.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/confirm_appointment.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/get_detail_appointment.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/reject_appointment.dart';
import 'package:libela_practition/app/features/schedule/domain/usecase/set_reminder.dart';
import '../../features/auth/data/data_sources/auth_remote_data_sources.dart';
import '../../features/auth/data/repositories/auth_repositories_impl.dart';
import '../../features/auth/domain/repositories/auth_repositories.dart';
import '../../features/auth/domain/usecase/get_content_onboarding.dart';
import '../../features/auth/domain/usecase/get_countries.dart';
import '../../features/auth/domain/usecase/login.dart';
import '../../features/auth/domain/usecase/login_verify_otp.dart';
import '../../features/auth/domain/usecase/register.dart';
import '../../features/auth/domain/usecase/upload_file.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/data_source/home_remote_data_source_impl.dart';
import '../../features/home/data/repositories/home_repositories_impl.dart';
import '../../features/home/domain/repositories/home_repositories.dart';
import '../../features/notification/data/data_sources/notification_remote_data_source.dart';
import '../../features/notification/data/data_sources/notification_remote_data_source_impl.dart';
import '../../features/notification/data/repositories/notification_repositories_impl.dart';
import '../../features/notification/domain/repositories/notification_repositories.dart';
import '../../features/notification/domain/usecase/get_notification.dart';
import '../../features/profile/data/data_sources/profile_remote_data_source.dart';
import '../../features/profile/data/data_sources/profile_remote_data_source_impl.dart';
import '../../features/profile/data/repositories/profile_repositories_impl.dart';
import '../../features/profile/domain/repositories/profile_repositories.dart';
import '../../features/schedule/data/data_source/schedule_remote_data_sources.dart';
import '../../features/schedule/data/data_source/schedule_remote_data_sources_impl.dart';
import '../../features/schedule/data/repositories/schedule_repositories_impl.dart';
import '../../features/schedule/domain/repositories/schedule_repositories.dart';
import '../../features/schedule/domain/usecase/get_appointments.dart';
import '../../features/schedule/domain/usecase/start_session_appointment.dart';

final sl = GetIt.instance;

Future<void> initializeDepedencies() async {
  // Network
  sl.registerSingleton<DioClient>(DioClient());
  // Remote Data Source
  sl.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<AuthRepositories>(AuthRepositoriesImpl(sl()));

  sl.registerSingleton<ProfileRemoteDataSource>(
      ProfileRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<ProfileRepositories>(ProfileRepositoriesImpl(sl()));

  sl.registerSingleton<ScheduleRemoteDataSource>(
      ScheduleRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<ScheduleRepositories>(ScheduleRepositoriesImpl(sl()));

  sl.registerSingleton<NotificationRemoteDataSource>(
      NotificationRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<NotificationRepositories>(
      NotificationRepositoriesImpl(sl()));

  sl.registerSingleton<HomeRemoteDataSource>(
      HomeRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<HomeRepositories>(HomeRepositoriesImpl(sl()));

  // Auth Use Case
  sl.registerSingleton<ForgotPhoneNumber>(ForgotPhoneNumber(sl()));
  sl.registerSingleton<VerifyForgotPhone>(VerifyForgotPhone(sl()));
  sl.registerSingleton<ChangePhoneForgot>(ChangePhoneForgot(sl()));
  sl.registerSingleton<GetCountries>(GetCountries(sl()));
  sl.registerSingleton<GetProvinces>(GetProvinces(sl()));
  sl.registerSingleton<GetCities>(GetCities(sl()));
  sl.registerSingleton<RegisterPhone>(RegisterPhone(sl()));
  sl.registerSingleton<RegisterVerifyOtp>(RegisterVerifyOtp(sl()));
  sl.registerSingleton<Login>(Login(sl()));
  sl.registerSingleton<LoginVerifyOtp>(LoginVerifyOtp(sl()));
  sl.registerSingleton<GetProfession>(GetProfession(sl()));
  sl.registerSingleton<GetSpecialization>(GetSpecialization(sl()));
  sl.registerSingleton<GetServiceArea>(GetServiceArea(sl()));

  sl.registerSingleton<UploadFile>(UploadFile(sl()));
  sl.registerSingleton<UpdatePersonalData>(UpdatePersonalData(sl()));
  sl.registerSingleton<UpdateEmailData>(UpdateEmailData(sl()));
  sl.registerSingleton<UpdateProfessionData>(UpdateProfessionData(sl()));
  sl.registerSingleton<UpdateServiceAreaData>(UpdateServiceAreaData(sl()));
  sl.registerSingleton<UpdateDocumentData>(UpdateDocumentData(sl()));
  sl.registerSingleton<GetContentOnboarding>(GetContentOnboarding(sl()));

  // Profile Use Case
  sl.registerSingleton<GetUserProfile>(GetUserProfile(sl()));
  sl.registerSingleton<UploadImage>(UploadImage(sl()));
  sl.registerSingleton<UpdateProfile>(UpdateProfile(sl()));
  sl.registerSingleton<ChangePhoneRequest>(ChangePhoneRequest(sl()));
  sl.registerSingleton<ChangePhoneVerify>(ChangePhoneVerify(sl()));
  sl.registerSingleton<UpdateEmail>(UpdateEmail(sl()));

  // Schedule Use Case
  sl.registerSingleton<GetAppointments>(GetAppointments(sl()));
  sl.registerSingleton<SetReminder>(SetReminder(sl()));
  sl.registerSingleton<GetDetailAppointments>(GetDetailAppointments(sl()));
  sl.registerSingleton<ConfirmAppointment>(ConfirmAppointment(sl()));
  sl.registerSingleton<AcceptAppointment>(AcceptAppointment(sl()));
  sl.registerSingleton<RejectAppointment>(RejectAppointment(sl()));
  sl.registerSingleton<StartSessionAppointment>(StartSessionAppointment(sl()));

  // Home Use Case
  sl.registerSingleton<GetPendingAppointments>(GetPendingAppointments(sl()));

  // Notification Use Case
  sl.registerSingleton<GetNotifications>(GetNotifications(sl()));
}
