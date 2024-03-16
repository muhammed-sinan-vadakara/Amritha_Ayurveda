import 'package:flutter/material.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/patient_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';
import 'package:amritha_ayurveda/feactures/home/domain/usecases/get_patients_usecase.dart';
import 'package:amritha_ayurveda/feactures/home/domain/usecases/update_patient_usecase.dart';
import 'package:get_it/get_it.dart';

class PatientProvider extends ChangeNotifier {
  Future<List<PatientEntity>> getPatient() async {
    return await GetPatintsUsecase(repository: GetIt.I.get<ApiRepository>())();
  }

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
  ) async {
    final repository = GetIt.I.get<ApiRepository>();
    await UpdatePatientUseCase(repository: repository)(
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
      treatmentTime,
    );
  }
}
