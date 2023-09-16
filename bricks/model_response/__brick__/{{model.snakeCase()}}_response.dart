
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{model.snakeCase()}}_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class {{model.pascalCase()}}Response extends Equatable {
  const {{model.pascalCase()}}Response();

  static {{model.pascalCase()}}Response fromJson(Map<String, dynamic> json) =>
      _${{model.pascalCase()}}ResponseFromJson(json);

  Map<String?, dynamic> toJson() => _${{model.pascalCase()}}ResponseToJson(this);

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '{{model.pascalCase()}}Response{}';
  }
}