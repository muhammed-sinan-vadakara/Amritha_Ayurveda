import 'package:amritha_ayurveda/feactures/home/domain/entity/branch_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/patient_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/treatment_entity.dart';

abstract class ApiRepository {
  Future<List<PatientEntity>> getDatas();
  Future<List<BranchEntity>> getBranchs();
  Future<List<TreatmentEntity>> getTreatment();
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
