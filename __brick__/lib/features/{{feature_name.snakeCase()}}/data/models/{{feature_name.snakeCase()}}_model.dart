import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:{{project_name}}/core/utils/constants/model_type_ids.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';

part '{{feature_name.snakeCase()}}_model.g.dart';

@HiveType(typeId: ModelTypeIds.{{feature_name.camelCase()}})
@JsonSerializable()
class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}} {
  @override
  @HiveField(0)
  String? get id => super.id;
  const {{feature_name.pascalCase()}}Model({super.id});

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{feature_name.pascalCase()}}ModelFromJson(json);
} 