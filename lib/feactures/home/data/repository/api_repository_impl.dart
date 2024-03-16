import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';
import 'package:amritha_ayurveda/feactures/home/data/datasource/api_services_datasource.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/branch_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/patient_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/treatment_entity.dart';
import 'package:amritha_ayurveda/feactures/home/data/model/api_model.dart'
    as api;

class ApiRepositoryImpl implements ApiRepository {
  final ApiServicesDataSource dataSource;
  ApiRepositoryImpl({required this.dataSource});
  @override
  Future<List<PatientEntity>> getDatas() async {
    final data = await dataSource.getDatas();

    late List<PatientEntity> results;

    results = [
      for (final result in data)
        PatientEntity(
          id: result.id,
          user: result.user,
          payment: result.payment,
          name: result.name,
          phone: result.phone,
          address: result.address,
          price: result.price,
          totalAmount: result.totalAmount,
          discountAmount: result.discountAmount,
          advanceAmount: result.advanceAmount,
          balanceAmount: result.balanceAmount,
          dateNdTime: result.dateNdTime,
          isActive: result.isActive,
          createdAt: result.createdAt,
          updatedAt: result.updatedAt,
        ),
    ];
    return results;
  }

  @override
  Future<List<BranchEntity>> getBranchs() async {
    final data = await dataSource.getBranches();
    late List<BranchEntity> results;
    results = [
      for (final result in data)
        BranchEntity(
          id: result.id,
          name: result.name,
          patientsCount: result.patientsCount,
          location: result.location,
          phone: result.phone,
          mail: result.mail,
          address: result.address,
          gst: result.gst,
          isActive: result.isActive,
        ),
    ];
    return results;
  }

  @override
  Future<List<TreatmentEntity>> getTreatment() async {
    final data = await dataSource.getTeatemetns();
    late List<TreatmentEntity> results;
    results = [
      for (final result in data)
        TreatmentEntity(
          id: result.id,
          name: result.name,
          duration: result.duration,
          price: result.price,
          isActive: result.isActive,
          createdAt: result.createdAt,
          updatedAt: result.updatedAt,
        ),
    ];
    return results;
  }

  @override
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
    final treatmentsModel = [
      for (final treat in treatments)
        api.PatientdetailsSet(
          id: treat.id,
          female: treat.female,
          male: treat.male,
          patient: treat.patient,
          treatment: treat.treatment,
          treatmentName: treat.treatmentName,
        )
    ];
    final br = api.Branch(
      id: branch.id,
      name: name,
      patientsCount: branch.patientsCount,
      location: location,
      phone: phone,
      mail: branch.mail,
      address: address,
      gst: branch.gst,
      isActive: branch.isActive,
    );
    await dataSource.addPatient(
      name,
      phone,
      whatsappNumber,
      address,
      location,
      br,
      treatmentsModel,
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
