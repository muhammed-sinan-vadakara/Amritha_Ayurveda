import 'package:amritha_ayurveda/feactures/home/domain/entity/patient_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';

final class GetPatintsUsecase {
  final ApiRepository repository;
  GetPatintsUsecase({required this.repository});

  Future<List<PatientEntity>> call() async {
    try {
      return await repository.getDatas();
    } catch (e) {
      throw Exception('Error');
    }
  }
}
