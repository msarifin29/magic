import 'package:equatable/equatable.dart';
import 'data_api_failure.dart';

class ConstantErrorMessage {
  final String connectionError = "messageConnectionFailure";
  final String connectionRefused = "statusCode was called on null";
  final String unknownError = "unknown error";
}

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final DataApiFailure dataApiFailure;

  ServerFailure(this.dataApiFailure);

  @override
  List<Object?> get props => [dataApiFailure];

  @override
  String toString() {
    return "ServerFailure(dataApiFailure: $dataApiFailure)";
  }
}

class CacheFailure extends Failure {
  final String errorMessage;

  CacheFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return "CacheFailure(errorMessage: $errorMessage)";
  }
}

class ConnectionFailure extends Failure {
  final String errorMessage = ConstantErrorMessage().connectionError;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return "ConnectionFailure(errorMessage: $errorMessage)";
  }
}

class ParsingFailure extends Failure {
  final String errorMessage;

  ParsingFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return "ParsingFailure(errorMessage: $errorMessage)";
  }
}
