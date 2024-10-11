import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/authentication/data/model/response_auth_model.dart';

abstract class AuthenticationRepository {
  Future<Either<ServerFailure, ResponseAuthModel>> auth(
    String id,
    String password,
  );
}
