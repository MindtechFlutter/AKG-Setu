class AppConstants {
  //App related
  static const String appName = 'Busybees';
  static const String appVersion = "";
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String enterPhnNo = 'Enter Your Phone Number';
  static const String enterEmailId = 'Enter Email ID';
  static const String enterPassword = 'Enter Password';
  static const String enterOtpSent = 'Enter OTP sent to';

  static const String enterCredentials = 'Enter Your Email Id And Password';
  static const String mobileno = "Mobile number";
  static const String email = "Email Id";
  static const String password = "Password";

  static const String noInternet = 'Please check your internet connection';

  //keys for pref
  static const String tokenPr = 'tokenPr';
  static const String isLoggedIn = 'isLoggedInPr';
  static const String loginPref = 'loginPref';

  //apiparams
  static const String usernameK = 'username';
  static const String passwordK = 'password';
  static const String employeeIdK = 'employeeId';
  static const String productMasterIdK = 'productMaster';

  //Device details
  static const String platform = "android";
  static const String version = "13";
  static const String sdk = "33";
  static const String brandName = "google";
  static const String deviceName = "emu64x";
  static const String deviceId = "TE1A.220922.010";

  // static const String passwordK = 'phone';

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
  static const String completedTasks = 'Completed';
  static const String dsr = 'Digital Service Report';

  static const String inventory = 'Inventory';
  static const String vouchers = 'Vouchers';
  static const String holidays = 'Holidays';
  static const String WIP = 'WIP';

  static const List<String> listExpenses = [
    "Type of Expense",
    "Travel",
    "Food",
    "Lodge",
    "Other",
  ];

  static const List<String> listModeOfTravel = [
    "Mode of Travel",
    "Bike",
    "Car",
    "Public Transport",
  ];

  static const List<String> listTypeOfTravel = [
    "Type of Travel",
    "Customer Site",
    "OnWay",
    "EndJourney",
  ];

  static const List<String> listPurposeOfvisit = [
    "Purpose Of Visit",
    "ServiceCall",
    "Payment Recovery",
    "Installing",
    "Marketing",
    "Other",
  ];

  static const List<String> listcallStatus = [
    "Call Status",
    "Solved",
    "Pending",
    "Not A Call",
  ];

  static const List<String> installingStatus = [
    "Installing Status",
    "Complete",
    "Partly",
    "Not Done",
  ];

  static const List<String> listFoodType = [
    "Food Type",
    "Daily",
    "Paid",
  ];

  static const List<String> listInstallingStatus = [
    "Installing Status",
    "Complete",
    "Partly",
    "Not Done",
  ];

  static const List<String> listTypeofVehicle = [
    "Type",
    "Bus",
    "Railway",
    "Rickshaw",
    "Private",
    "Other",
  ];
}
