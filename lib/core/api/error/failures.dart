import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String? mess;

  ServerFailure({
    this.mess,
  });

  @override
  List<Object> get props => [mess!];
}
