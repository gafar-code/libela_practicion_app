class Endpoints {
  // Auth
  static const String login = 'auths/practitioner/login/phone';
  static const String registerPhone = 'auths/practitioner/register/phone';
  static const String registerVerifyOtp =
      'auths/practitioner/register/phone/otp';

  static const String loginVerifyOtp = 'auths/practitioner/login/phone/otp';

  static const String provinces = 'internal/master/provincies';
  static const String cities = 'internal/master/cities';

  static const String serviceArea = 'internal/master/service-areas';
  static const String professions = 'internal/master/professions';
  static const String specialization =
      'internal/master/professions/specialization';

  static const String personalData =
      'auths/practitioner/register/personal-data';
  static const String personalEmail = 'auths/practitioner/register/email';
  static const String profession = 'auths/practitioner/register/profession';
  static const String personalServiceArea =
      'auths/practitioner/register/personal-service-areas';
  static const String personalDocument =
      'auths/practitioner/register/personal-documents';
  static const String forgotPhoneRequest =
      'auths/practitioner/forgot-phone/request';
  static const String verifyForgotPhone =
      'auths/practitioner/forgot-phone/verify';
  static const String changePhone =
      'auths/practitioner/forgot-phone/change-phone';

  // Schedule
  static const String appointments = 'appointments';
  static const String appointmentsPending =
      'appointments/pending/need-acceptations';

// uploader
  static const String uploadAvatar = 'internal/tools/upload/avatar';
  static const String uploadFile = 'internal/tools/upload/file';

  // profile
  static const String userProfile = 'practitioner/profile';
  static const String changePhoneRequest =
      'auths/practitioner/change-phone/request';
  static const String changePhoneVerify =
      'auths/practitioner/change-phone/verify';
  static const String faq = 'internal/master/faq';

  // bank
  static const String banks = 'internal/master/banks';
  static const String bankAccount = 'practitioner/bank/account';

  // wallet
  static const String wallet = 'wallet';
  static const String walletWithdraw = 'wallet/withdraw';
  static const String transactionsHistory = 'wallet/transactions/history';
  static const String transactionsLine = 'wallet/transactions/line';

  // notification
  static const String notifications = 'notifications';

  static const Duration connectTimeout = Duration(milliseconds: 15000);
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
}
