import 'package:amritha_ayurveda/feactures/home/domain/entity/patient_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';

final class UpdatePatientUseCase {
  final ApiRepository repository;
  UpdatePatientUseCase({required this.repository});

  Future<void> call(
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
  ) async {
    try {
      await repository.addPatient(
          name,
          phone,
          whatsappNumber,
          address,
          location,
          branch,
          treatments,
          totalAmount,
          discountAmount,
          payment,
          balanceAmount,
          advanceAmount,
          treatmentDate,
          treatmentTime);
    } catch (e) {
      throw Exception('Error');
    }
  }
}
