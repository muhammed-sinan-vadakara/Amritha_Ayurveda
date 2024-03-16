import 'package:flutter/material.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/branch_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';
import 'package:amritha_ayurveda/feactures/home/domain/usecases/get_branches_usecase.dart';
import 'package:get_it/get_it.dart';

class BranchProvider extends ChangeNotifier {
  Future<List<BranchEntity>> getBranch() async {
    return await GetBranchesUsecase(repository: GetIt.I.get<ApiRepository>())();
  }
}
