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

  // ===============Fetch Locations====================//
  final String uRlFetchLocation = '${baseUrl}fetch_locations';
  final String uRlFetchLocationById = '${baseUrl}set_location_info';

  //=========== Fetch Home===============//
  final String urlFetchHome = "${baseUrl}fetch_home";
  final String urlChangeDriverActiveStatus = "${baseUrl}change_driver_active_status";

  //=============Fetch trips =========//
  // final String urlFetchTrips = "${baseUrl}fetch_my_trips";
  // final String urlFetchCategoryTrip = "${baseUrl}check_trip_details";
  // final String urlRequestTrip = "${baseUrl}request_trip";
  final String urlFetchAssignedTrips = "${baseUrl}fetch_assigned_trips";
  final String urlFetchLastTrips = "${baseUrl}fetch_last_trip";
  final String urlFetchCurrentTrips = "${baseUrl}fetch_current_trip";
  final String urlAddTripRate = "${baseUrl}add_trip_rate";
  final String urlPayCache = "${baseUrl}pay_cache";


  final String urlCancelClientTrip = "${baseUrl}client_cancel_trip";
  //=============Fetch Sections =========//
  final String urlFetchSection = "${baseUrl}fetch_categories";

  // ===========Trip accept===========//
  final String urlAcceptTrip="${baseUrl}accept_trip";
  final String urlArrivedTrip="${baseUrl}arrive_trip";
  final String urlStartTrip="${baseUrl}start_trip";
  final String urlEndTrip="${baseUrl}end_trip";
  final String urlCancelTrip="${baseUrl}cancel_trip";
  final String urlRefuseTrip="${baseUrl}refuse_trip";
  final String urlFetchTripReasons="${baseUrl}fetch_cancel_reasons";



  //===========Fetch Products===========//
  String urlFetchLatestProducts({int pageId = 1}) =>
      "${baseUrl}fetch_latest_products?page=$pageId";
  final String urlFetchProductsDetails = "${baseUrl}fetch_product_details";
  final String urlFetchSimilarProducts = "${baseUrl}fetch_similar_product";
  final String urlFetchFavouritesProducts = "${baseUrl}fetch_favorite_products";
  final String urlSetFavouritesProducts = "${baseUrl}set_favorite_product";
  final String urlFetchProductsReview = "${baseUrl}fetch_product_reviews";
  final String urlSetProductsReview = "${baseUrl}review_product";
  final String urlScanProduct = "${baseUrl}scan_product";
  final String urlBuyProduct = "${baseUrl}buy_products";
  final String urlCategoryProducts = "${baseUrl}fetch_category_products";

  //============ Blogs================//
  final String uRlFetchBlogs = "${baseUrl}fetch_blogs";
  final String urlFetchBlogsDetails = "${baseUrl}fetch_blog_details";
  //================Gifts=================//
  final String urlFetchGifts = "${baseUrl}fetch_gifts";
  final String urlFetchTransactions = "${baseUrl}fetch_transactions";
  final String urlFetchUserPoints = "${baseUrl}fetch_user_points";
  final String urlBuyGifts = "${baseUrl}buy_gift";

  //==================Search===================//
  final String urlSearch = "${baseUrl}seach_products";

  // =================Profile Screen================//
  final String urlNotification = "${baseUrl}fetch_notifictions";
  final String uRLFetchPrivacy = '${baseUrl}fetch_privacy';
  final String uRLFetchConditions = '${baseUrl}fetch_term';
  final String uRLFetchSettings = '${baseUrl}fetch_contact_info';
  final String uRLFetchQuestions = '${baseUrl}fetch_questions';
  final String uRLContactUs = '${baseUrl}contact_us';
  final String uRLFetchFaq = '${baseUrl}fetch_faq';
  final String uRlUpdateProfile = '${baseUrl}update_profile';
  final String uRlFetchProfile = '${baseUrl}fetch_profile';
  final String uRLFetchAbout = '${baseUrl}about_app';
  final String uRLFilterSellingPorts = '${baseUrl}filter_selling_ports';

  //=================Contact Us================//
  final String urLSendContactUs = '${baseUrl}contact_us';

  //================= Wallet ================//
  final String urlFetchWalletBalance = "${baseUrl}fetch_my_wallet";
  final String urlFetchWalletHistory = "${baseUrl}fetch_my_wallet_history";
  final String urlChargeWallet = "${baseUrl}fetch_my_wallet_history";

  //================= category ================//
  final String urlFetchCategoryTrip = "";


  //================= changeLocation ================//
  final String urlChangeDriverLocation = "${baseUrl}change_driver_location";

  /// =============== Fetch Cars ====================//
  final String urlFetchCarModels = "${baseUrl}fetch_models";
  final String urlFetchCarBrands = "${baseUrl}fetch_brands";
  final String urlFetchCarsTypes = "${baseUrl}fetch_types";
  final String urlFetchCarYears = "${baseUrl}fetch_years";




  final String fetchDistanceMatrixURL =
      'https://maps.googleapis.com/maps/api/distancematrix/json';




  // New Api
  final String urlAddPatient = "${baseUrl}add_patient";    
}