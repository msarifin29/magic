import 'package:equatable/equatable.dart';
import 'data_api_failure.dart';

class ConstantErrorMessage {
  final String connectionError = "No Connection Internet";
  final String connectionRefused = "StatusCode was called on Null";
  final String unknownError = "Unknown Error";
}

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String errorMessage;

  ServerFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return "ServerFailure(errorMessage: $errorMessage)";
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
