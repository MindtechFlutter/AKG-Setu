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

  //keys for Sharedpref
  static const String tokenPr = 'tokenPr';
  static const String isLoggedIn = 'isLoggedInPr';
  static const String loginPref = 'loginPref';
  static const String employeeIdPr = 'employeeId';

  //**********************apiparams*************************
  static const String usernameK = 'username';
  static const String emailk = 'email';
  static const String passwordK = 'password';
  static const String productMasterIdK = 'productMaster';

  //For device details login
  static const String platformK = 'platform';
  static const String versionK = 'version';
  static const String sdkK = 'sdk';
  static const String brandNameK = 'brandName';
  static const String deviceNameK = 'deviceName';
  static const String deviceIdK = 'deviceId';
  static const String appversionK = 'appversion';

  //For voucher api
  static const String voucherdateK = 'voucherdate';
  static const String employeeidK = 'employeeid';
  static const String expensetypeK = 'expensetype';
  static const String modeK = 'mode';
  static const String fromplaceK = 'fromplace';
  static const String toplaceK = 'toplace';
  static const String totalkmK = 'totalkm';
  static const String rateK = 'rate';
  static const String amountK = 'amount';
  static const String vehicletypeK = 'vehicletype';
  static const String ticketbillK = 'ticketbill';
  static const String traveltypeK = 'traveltype';
  static const String visitpurposeK = 'visitpurpose';
  static const String servicereportK = 'servicereport';
  static const String callidK = 'callid';
  static const String callidnumberK = 'callidnumber';
  static const String callstatusK = 'callstatus';
  static const String paymentreceivedK = 'paymentreceived';
  static const String paymenttypeK = 'paymenttype';
  static const String paymentamountK = 'paymentamount';
  static const String oreasontK = 'oreasont';
  static const String gstbillK = 'gstbill';
  static const String employeeremarksK = 'employeeremarks';

  //errors
  static const String errorFName = "Please enter first name";
  static const String errorLName = "Please enter last name";
  static const String errorEmail = "Please enter email";
  static const String validEmail = "Please enter valid email";
  static const String validPhone = "Please enter valid phone number";
  static const String validPhoneCode = "Phone number must start with \"971\"";
  static const String otpDoesntMatch = "Otp doesn't match";
  static const String validOtp = "Please enter valid otp";
  static const String errorDate = "Please select a date";
  static const String errorTypeOfExpense = "Please select a type of Expense";
  static const String errorModeOfTravel = "Please select a mode of Travel";
  static const String errorFromPlace = "Please select from Place";
  static const String errorToPlace = "Please select To Place";
  static const String errortotalKilometer = "Please select Total Kilometer";
  static const String errorratePerKilometer =
      "Please select Rate Per Kilometer";
  static const String errorAmount = "Please enter Valid Amount";

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
