import 'package:amritha_ayurveda/feactures/home/domain/entity/branch_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';

final class GetBranchesUsecase {
  final ApiRepository repository;
  GetBranchesUsecase({required this.repository});

  Future<List<BranchEntity>> call() async {
    try {
      return await repository.getBranchs();
    } catch (e) {
      throw Exception('Error');
    }
  }
}
