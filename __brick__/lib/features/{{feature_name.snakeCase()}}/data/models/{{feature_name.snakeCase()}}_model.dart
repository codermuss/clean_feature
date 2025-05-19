import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';

part '{{feature_name.snakeCase()}}_model.g.dart';

@JsonSerializable()
class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}} {
  const {{feature_name.pascalCase()}}Model({
    required String id,
    required String name,
    required String description,
  }) : super(
          id: id,
          name: name,
          description: description,
        );

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{feature_name.pascalCase()}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{feature_name.pascalCase()}}ModelToJson(this);
} 