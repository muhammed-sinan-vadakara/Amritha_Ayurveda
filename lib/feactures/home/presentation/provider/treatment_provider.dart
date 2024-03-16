import 'package:flutter/material.dart';
import 'package:amritha_ayurveda/feactures/home/domain/entity/treatment_entity.dart';
import 'package:amritha_ayurveda/feactures/home/domain/repository/api_repository.dart';
import 'package:amritha_ayurveda/feactures/home/domain/usecases/get_treatment_usecase.dart';
import 'package:get_it/get_it.dart';

class TreatmentProvider extends ChangeNotifier {
  Future<List<TreatmentEntity>> getTreatment() async {
    return await GetTreatmentUsecase(
        repository: GetIt.I.get<ApiRepository>())();
  }
}
