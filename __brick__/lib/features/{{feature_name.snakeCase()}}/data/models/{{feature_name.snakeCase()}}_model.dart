import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';

part '{{feature_name.snakeCase()}}_model.g.dart';

@JsonSerializable(explicitToJson: false)
class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}} {
  const {{feature_name.pascalCase()}}Model({required String? id}) : super(id: id??'default_value');

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{feature_name.pascalCase()}}ModelFromJson(json);
} 