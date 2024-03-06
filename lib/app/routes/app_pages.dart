import 'package:get/get.dart';

import '../core/middleware/auth_middleware.dart';
import '../core/middleware/onboarding_middleware.dart';
import '../features/auth/presentation/pages/forgot_number/bindings/forgot_number_binding.dart';
import '../features/auth/presentation/pages/forgot_number/views/forgot_number_view.dart';
import '../features/auth/presentation/pages/forgot_otp/bindings/forgot_otp_binding.dart';
import '../features/auth/presentation/pages/forgot_otp/views/forgot_otp_view.dart';
import '../features/auth/presentation/pages/forgot_password/bindings/forgot_password_binding.dart';
import '../features/auth/presentation/pages/forgot_password/views/forgot_password_view.dart';
import '../features/auth/presentation/pages/forgot_success/bindings/forgot_success_binding.dart';
import '../features/auth/presentation/pages/forgot_success/views/forgot_success_view.dart';
import '../features/auth/presentation/pages/login/bindings/login_binding.dart';
import '../features/auth/presentation/pages/login/views/login_view.dart';
import '../features/auth/presentation/pages/login_otp/bindings/login_otp_binding.dart';
import '../features/auth/presentation/pages/login_otp/views/login_otp_view.dart';
import '../features/auth/presentation/pages/new_number/bindings/new_number_binding.dart';
import '../features/auth/presentation/pages/new_number/views/new_number_view.dart';
import '../features/auth/presentation/pages/onboarding/bindings/onboarding_binding.dart';
import '../features/auth/presentation/pages/onboarding/views/onboarding_view.dart';
import '../features/auth/presentation/pages/register/bindings/register_binding.dart';
import '../features/auth/presentation/pages/register/views/register_view.dart';
import '../features/auth/presentation/pages/register_form/bindings/register_form_binding.dart';
import '../features/auth/presentation/pages/register_form/views/register_form_view.dart';
import '../features/auth/presentation/pages/register_otp/bindings/register_otp_binding.dart';
import '../features/auth/presentation/pages/register_otp/views/register_otp_view.dart';
import '../features/auth/presentation/pages/splash_screen/bindings/splash_screen_binding.dart';
import '../features/auth/presentation/pages/splash_screen/views/splash_screen_view.dart';
import '../features/auth/presentation/pages/verification_info/bindings/verification_info_binding.dart';
import '../features/auth/presentation/pages/verification_info/views/verification_info_view.dart';
import '../features/home/presentation/pages/dashboard/bindings/dashboard_binding.dart';
import '../features/home/presentation/pages/dashboard/views/dashboard_view.dart';
import '../features/home/presentation/pages/detail_appointment/bindings/detail_appointment_binding.dart';
import '../features/home/presentation/pages/detail_appointment/views/detail_appointment_view.dart';
import '../features/home/presentation/pages/form_action/bindings/form_action_binding.dart';
import '../features/home/presentation/pages/form_action/views/form_action_view.dart';
import '../features/home/presentation/pages/incoming_request/bindings/incoming_request_binding.dart';
import '../features/home/presentation/pages/incoming_request/views/incoming_request_view.dart';
import '../features/home/presentation/pages/visit_is_over/bindings/visit_is_over_binding.dart';
import '../features/home/presentation/pages/visit_is_over/views/visit_is_over_view.dart';
import '../features/main/presentation/pages/main_pages/bindings/main_pages_binding.dart';
import '../features/main/presentation/pages/main_pages/views/main_pages_view.dart';
import '../features/profile/presentation/pages/bank_rekening/bindings/bank_rekening_binding.dart';
import '../features/profile/presentation/pages/bank_rekening/views/bank_rekening_view.dart';
import '../features/profile/presentation/pages/chat_support/bindings/chat_support_binding.dart';
import '../features/profile/presentation/pages/chat_support/views/chat_support_view.dart';
import '../features/profile/presentation/pages/detail_personal_data/bindings/detail_personal_data_binding.dart';
import '../features/profile/presentation/pages/detail_personal_data/views/detail_personal_data_view.dart';
import '../features/profile/presentation/pages/edit_email/bindings/edit_email_binding.dart';
import '../features/profile/presentation/pages/edit_email/views/edit_email_view.dart';
import '../features/profile/presentation/pages/edit_number_phone/bindings/edit_number_phone_binding.dart';
import '../features/profile/presentation/pages/edit_number_phone/views/edit_number_phone_view.dart';
import '../features/profile/presentation/pages/faq/bindings/faq_binding.dart';
import '../features/profile/presentation/pages/faq/views/faq_view.dart';
import '../features/profile/presentation/pages/personal_data/bindings/personal_data_binding.dart';
import '../features/profile/presentation/pages/personal_data/views/personal_data_view.dart';
import '../features/profile/presentation/pages/profile_page/bindings/profile_page_binding.dart';
import '../features/profile/presentation/pages/profile_page/views/profile_page_view.dart';
import '../features/schedule/presentation/pages/schedule_page/bindings/schedule_page_binding.dart';
import '../features/schedule/presentation/pages/schedule_page/views/schedule_page_view.dart';
import '../features/wallet/presentation/pages/wallet_page/bindings/wallet_page_binding.dart';
import '../features/wallet/presentation/pages/wallet_page/views/wallet_page_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),
        middlewares: [OnboardingMiddleware()]),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_OTP,
      page: () => const RegisterOtpView(),
      binding: RegisterOtpBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_FORM,
      page: () => const RegisterFormView(),
      binding: RegisterFormBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_OTP,
      page: () => const ForgotOtpView(),
      binding: ForgotOtpBinding(),
    ),
    GetPage(
        name: _Paths.MAIN_PAGES,
        page: () => const MainPagesView(),
        binding: MainPagesBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_PAGE,
      page: () => const WalletPageView(),
      binding: WalletPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_PAGE,
      page: () => const SchedulePageView(),
      binding: SchedulePageBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_INFO,
      page: () => const VerificationInfoView(),
      binding: VerificationInfoBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_NUMBER,
      page: () => const ForgotNumberView(),
      binding: ForgotNumberBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_SUCCESS,
      page: () => const ForgotSuccessView(),
      binding: ForgotSuccessBinding(),
    ),
    GetPage(
      name: _Paths.NEW_NUMBER,
      page: () => const NewNumberView(),
      binding: NewNumberBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_DATA,
      page: () => const PersonalDataView(),
      binding: PersonalDataBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PERSONAL_DATA,
      page: () => const DetailPersonalDataView(),
      binding: DetailPersonalDataBinding(),
    ),
    GetPage(
      name: _Paths.BANK_REKENING,
      page: () => const BankRekeningView(),
      binding: BankRekeningBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EMAIL,
      page: () => const EditEmailView(),
      binding: EditEmailBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NUMBER_PHONE,
      page: () => const EditNumberPhoneView(),
      binding: EditNumberPhoneBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SUPPORT,
      page: () => const ChatSupportView(),
      binding: ChatSupportBinding(),
    ),
    GetPage(
      name: _Paths.VISIT_IS_OVER,
      page: () => const VisitIsOverView(),
      binding: VisitIsOverBinding(),
    ),
    GetPage(
      name: _Paths.INCOMING_REQUEST,
      page: () => const IncomingRequestView(),
      binding: IncomingRequestBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_APPOINTMENT,
      page: () => const DetailAppointmentView(),
      binding: DetailAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.FORM_ACTION,
      page: () => const FormActionView(),
      binding: FormActionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_OTP,
      page: () => const LoginOtpView(),
      binding: LoginOtpBinding(),
    ),
  ];
}
