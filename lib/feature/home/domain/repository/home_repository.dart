import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';

abstract class HomeRepository {
  Future<Either<ServerFailure, List<AIAgentModel>>> getRecommendAgent();

  Future<Either<ServerFailure, List<AttributeFilterModel>>> getListOccupation();

  Future<Either<ServerFailure, List<AttributeFilterModel>>> getListHobbies();

  Future<Either<ServerFailure, List<AttributeFilterModel>>> getListGenders();

  Future<Either<ServerFailure, List<AttributeAgeFilterModel>>> getListAges();
}
