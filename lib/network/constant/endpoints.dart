class Endpoints {
  Endpoints._();
  // base url
  static const String baseUrl = "http://api.akgsetu.in/Mindtech/";
  // receiveTimeout
  static const int receiveTimeout = 15000;
  // connectTimeout
  static const int connectionTimeout = 15000;
  static const String languageCode = 'en';
  static const String token = '/token';
  static const String login = '/login';
  static const String problemMaster = '/LISTProblemMasters';
  static const String productGroupMaster = '/LISTProductGroupMasters';
  static const String productMaster = '/LISTProductMasters';
  static const String activeTaskList = '/LISTActiveTask';
}
