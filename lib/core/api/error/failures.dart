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

class FirebaseAuthFailure extends Failure {
  final String code;

  FirebaseAuthFailure({
    required this.code,
  });
}

class HiveFailure extends Failure {
  final String? mess;

  HiveFailure({
    this.mess,
  });

  @override
  List<Object> get props => [mess!];
}
