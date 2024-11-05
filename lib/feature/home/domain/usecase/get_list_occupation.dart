import 'package:dartz/dartz.dart';
import 'package:shuei_ai_chat/core/api/error/failures.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/domain/repository/home_repository.dart';

class GetListOccupation
    implements UseCase<List<AttributeFilterModel>, NoParams> {
  final HomeRepository homeRepository;

  GetListOccupation({
    required this.homeRepository,
  });

  @override
  Future<Either<ServerFailure, List<AttributeFilterModel>>> call(
    NoParams params,
  ) async =>
      await homeRepository.getListOccupation();
}
