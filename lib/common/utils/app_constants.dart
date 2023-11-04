class AppConstants {
  //App related
  static const String appName = 'Busybees';
  static const int appVersion = 1;
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String enterPhnNo = 'Enter Your Phone Number';
  static const String enterOtpSent = 'Enter OTP sent to';

  static const String sendVerificationCode =
      'We will send you 4 digit verification code';
  static const String mobileno = "Mobile number";

  static const String noInternet = 'Please check your internet connection';

  //keys for pref
  static const String tokenPr = 'tokenPr';
  static const String isLoggedIn = 'isLoggedInPr';
  static const String loginPref = 'loginPref';

  //errors
  static const String errorFName = "Please enter first name";
  static const String errorLName = "Please enter last name";
  static const String errorEmail = "Please enter email";
  static const String validEmail = "Please enter valid email";
  static const String validPhone = "Please enter valid phone number";
  static const String validPhoneCode = "Phone number must start with \"971\"";
  static const String otpDoesntMatch = "Otp doesn't match";
  static const String validOtp = "Please enter valid otp";

  static const String errorName = "Please enter your name";
  static const String errorStreet = "Please enter Street";
  static const String errorAddressType = "Please enter Address Type";
  static const String errorAddressDetails = "Please enter building/Flat.no";
  static const String errorPhone = "Please enter phone number";

  static get validPwdField =>
      "kindly use a mix of upper and lowercase \nletters,numbers, symbols and minimum \n6 characters length";
  static const String errorPassword = "Please enter password";
  static const String errorNewPassword = "Please enter new password";
  static const String errorConfirmPassword = "Please enter confirm password";

  static const String logout = 'Logout';
  static const String otpVerification = 'OTP Verification';

      static const String activeTask = 'Active Task';
  static const String visitsCompleted = 'Visits';
  static const String inventory = 'Inventory';
  static const String vouchers = 'Vouchers';
  static const String holidays = 'Holidays';
  static const String WIP = 'WIP';
}
