import 'package:amritha_ayurveda/core/exceptions/authentication/auth_exception.dart';
import 'package:amritha_ayurveda/feactures/authentication/domain/entity/login_entity.dart';
import 'package:amritha_ayurveda/feactures/authentication/domain/repository/login_repository.dart';

final class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase({required this.repository});

  Future<LoginEntity> call(String name, String password) async {
    try {
      LoginEntity user = await repository.login(name, password);
      if (user.token != null) {
        return user;
      } else {
        throw AuthException(error: user.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
