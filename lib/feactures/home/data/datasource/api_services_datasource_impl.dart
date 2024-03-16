import 'dart:developer';

import 'package:amritha_ayurveda/core/constants/api_constants.dart';
import 'package:amritha_ayurveda/core/exceptions/api/api_exception.dart';
import 'package:amritha_ayurveda/feactures/home/data/datasource/api_services_datasource.dart';
import 'package:amritha_ayurveda/feactures/home/data/model/api_model.dart';
import 'package:amritha_ayurveda/feactures/home/data/model/branch_model.dart';
import 'package:amritha_ayurveda/feactures/home/data/model/treatment_model.dart';
import 'package:dio/dio.dart';

class ApiServicesDataSourceImpl implements ApiServicesDataSource {
  final Dio dio = Dio();
  static const link = ApiConstants.baseUrl;
  static const patientLink = ApiConstants.patientList;
  static const branchLink = ApiConstants.brancheList;
  static const treatmentLink = ApiConstants.treatmentList;
  static const tocken = ApiConstants.token;
  static const updatePatient = ApiConstants.treatmentUpdate;

  ///get patients data
  @override
  Future<List<Patient>> getDatas() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(link + patientLink);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <Patient>[];
        for (final result in data['patient']) {
          datas.add(
            Patient.fromJson(result),
          );
        }
        return datas;
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  ///get branches data
  @override
  Future<List<BranchModel>> getBranches() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(link + branchLink);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <BranchModel>[];
        for (final result in data['branches']) {
          datas.add(
            BranchModel.fromJson(result),
          );
        }
        return datas;
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  ///get treatment data
  @override
  Future<List<Treatment>> getTeatemetns() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(link + treatmentLink);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <Treatment>[];
        for (final result in data['treatments']) {
          datas.add(
            Treatment.fromJson(result),
          );
        }
        return datas;
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on Exception catch (_) {
      rethrow;
    }
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
    final dio = Dio();
    const apiUrl = link + updatePatient;
    try {
      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': tocken,
          },
        ),
        data: {
          'name': name,
          'phone': phone,
          'whatsappNumber': whatsappNumber,
          'address': address,
          'location': location,
          'branch': branch.toJson(),
          'treatments':
              treatments.map((treatment) => treatment.toJson()).toList(),
          'totalAmount': totalAmount,
          'discountAmount': discountAmount,
          'payment': payment,
          'balanceAmount': balanceAmount,
          'advanceAmount': advanceAmount,
          'treatmentDate': treatmentDate.toString(),
          'treatmentTime': treatmentTime.toString(),
        },
      );

      if (response.statusCode == 200) {
        log('Patient added successfully');
      } else {
        log('Failed to add patient. Error: ${response.data}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
