mixin ApiNames {
  static const String baseUrl = "http://192.168.1.47:8000/api/driver/";
  // static const String baseUrl = "https://transport.x-coders.net/api/driver/";
  //"https://anjo.crazyidea.online/api/";

  //===================== Auth =======================//
  final String uRLLogin = "${baseUrl}login";
  final String uRLRegister = "${baseUrl}register";
  final String uRLVerifyPhone = "${baseUrl}verify_phone";
  final String uRLCheckPhone = "${baseUrl}check_phone";
  final String uRLForgetPassword = "${baseUrl}forgot_password";
  final String uRLResetPassword = "${baseUrl}reset_password";
  final String uRLChangePassword = "${baseUrl}change_password";
  final String uRLCheckCode = "${baseUrl}check_code";
  final String uRLLogout = '${baseUrl}logout';
  final String uRLDeleteAccount = '${baseUrl}delete_account';

  //==================Search===================//
  final String urlSearch = "${baseUrl}seach_products";

  // =================Profile Screen================//
  final String urlNotification = "${baseUrl}fetch_notifictions";
  final String uRLFetchPrivacy = '${baseUrl}fetch_privacy';
  final String uRLFetchConditions = '${baseUrl}fetch_term';
  final String uRLFetchSettings = '${baseUrl}fetch_contact_info';
  final String uRLContactUs = '${baseUrl}contact_us';
  final String uRLFetchFaq = '${baseUrl}fetch_faq';
  final String uRlUpdateProfile = '${baseUrl}update_profile';
  final String uRlFetchProfile = '${baseUrl}fetch_profile';
  final String uRLFetchAbout = '${baseUrl}about_app';

  //=================Contact Us================//
  final String urLSendContactUs = '${baseUrl}contact_us';


  // New Api
  final String urlAddPatient = "${baseUrl}add_patient";
  final String urlFetchPatients = "${baseUrl}fetch_patients";
  final String urlFetchPatientDetails = "${baseUrl}fetch_patient_details";
  final String urlDeletePatient = "${baseUrl}delete_patient";
}