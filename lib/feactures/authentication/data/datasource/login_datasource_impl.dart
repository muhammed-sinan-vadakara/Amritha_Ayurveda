import 'package:amritha_ayurveda/core/constants/api_constants.dart';
import 'package:amritha_ayurveda/core/exceptions/api/api_exception.dart';
import 'package:amritha_ayurveda/feactures/authentication/data/datasource/login_datasource.dart';
import 'package:amritha_ayurveda/feactures/authentication/data/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final dio = Dio();
  static const link = ApiConstants.baseUrl;
  static const loginLink = ApiConstants.login;

  @override
  Future<LoginModel> login(String name, String password) async {
    try {
      final data = FormData.fromMap(
        {
          'username': name,
          'password': password,
        },
      );

      final response = await dio.post(link + loginLink, data: data);
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on DioException catch (_) {
      rethrow;
    }
  }
}
