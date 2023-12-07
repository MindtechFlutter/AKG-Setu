import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  var billPartStatus = 'returned'.obs;
  var lodgeStatus = 'returned'.obs;
  var foodStatus = 'returned'.obs;
  var selectedDate = "".obs;
  var selectedFiles = <PlatformFile>[].obs;
  var selectedFilesString = [].obs;
  final Rx<String?> foodType = Rxn<String?>();
  //Which expense is selected from expense List eg food,travel etc
  final Rx<String?> selectedExpense = Rxn<String?>();
  final Rx<String?> selectedModeOfTravel = Rxn<String?>();
  final Rx<String?> selectedTypeOfTravel = Rxn<String?>();
  final Rx<String?> selectedPurposeOfVisit = Rxn<String?>();
  final Rx<String?> selectedInstallingStatus = Rxn<String?>();
  final Rx<String?> selectedVehicleType = Rxn<String?>();
  final Rx<String?> paymentStatus = Rxn<String?>();
  final Rx<String?> callIdStatus = Rxn<String?>();
}
