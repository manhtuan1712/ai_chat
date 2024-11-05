import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/domain/repository/home_repository.dart';

class GetListAges implements UseCase<List<AttributeAgeFilterModel>, NoParams> {
  final HomeRepository homeRepository;

  GetListAges({
    required this.homeRepository,
  });

  @override
  Future<Either<ServerFailure, List<AttributeAgeFilterModel>>> call(
    NoParams params,
  ) async =>
      await homeRepository.getListAges();
}
