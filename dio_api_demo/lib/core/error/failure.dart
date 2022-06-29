import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  ServerFailure({
    this.code,
    this.message,
  });
  final dynamic code;
  final String? message;

  @override
  List<Object?> get props => [code, message];
}

class SoketFailure extends Failure {
  SoketFailure({
    this.message,
  });
  final String? message;

  @override
  List<Object?> get props => [message];
}
