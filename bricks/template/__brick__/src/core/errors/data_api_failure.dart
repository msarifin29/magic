import 'package:equatable/equatable.dart';

/// Class model ini berfungsi untuk menyimpan info-info kegagalan dari API
/// [code] nilai respons kode dari API
/// [status] status yang ada di respon API
/// [message] message yang dibuat http request atau Dio
/// [errorData] informasi error tambahan dari respon API, mis : validasi field

class DataApiFailure extends Equatable {
  final int? code;
  final String? status;
  final String? message;
  final Map<String, dynamic>? errorData;
  const DataApiFailure({
    this.code,
    this.status,
    this.message,
    this.errorData,
  });

  @override
  List<Object?> get props => [
        code,
        status,
        message,
        errorData,
      ];

  @override
  String toString() {
    return "DataApiFailure(code: $code, status: $status, message: $message, errorData: $errorData)";
  }
}
