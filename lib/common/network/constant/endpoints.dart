class Endpoints {
  Endpoints._();
  // base url
  static const String baseUrl = "";
  // receiveTimeout
  static const int receiveTimeout = 15000;
  // connectTimeout
  static const int connectionTimeout = 15000;
  static const String languageCode = 'en';
  static const String login = '/otp/login';
  static const String validate = '/otp/validate';

  static const String token = '/request/token';
  static const String updateProfilePhoto = '/update-profile-photo';
  static const String homePageBanner = '/get/homepage-banners';
  static const String services = '/get/b2c-services';
  static const String updateProfile = '/update-profile';
  static const String getUser = '/get-user';
  static const String createAddress = '/create/user_address';
  static const String updateAddress = '/update/user_address';
  static const String listOfAddress = '/get/user_addresses';
  static const String deleteAddress = '/delete/user_address';

  static const String get_wallet = '/get/wallet';
  static const String recharge_wallet = '/wallet/recharge';
  static const String create_booking = '/create-booking';
  static const String scheduled_services = '/scheduled-services';


}
