import 'package:amritha_ayurveda/feactures/home/data/model/api_model.dart';
import 'package:amritha_ayurveda/feactures/home/data/model/branch_model.dart';
import 'package:amritha_ayurveda/feactures/home/data/model/treatment_model.dart';

abstract class ApiServicesDataSource {
  Future<List<Patient>> getDatas();
  Future<List<BranchModel>> getBranches();
  Future<List<Treatment>> getTeatemetns();
  Future<void> addPatient(
    String name,
    String phone,
    String whatsappNumber,
    String address,
    String location,
    Branch branch,
    List<PatientdetailsSet> treatments,
    int totalAmount,
    int discountAmount,
    String payment,
    int balanceAmount,
    int advanceAmount,
    DateTime treatmentDate,
    DateTime treatmentTime,
  );
}
