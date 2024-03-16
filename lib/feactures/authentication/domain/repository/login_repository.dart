import 'package:amritha_ayurveda/feactures/authentication/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String name, String password);
}
