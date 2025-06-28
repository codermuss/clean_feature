import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}.dart';
import 'package:{{project_name}}/core/network/models/base_response.dart';
abstract class {{feature_name.pascalCase()}}LocalDataSource {
  {{#is_list}}
  Future<BaseResponse<List<{{feature_name.pascalCase()}}>>> getCached{{feature_name.pascalCase()}}s();
  Future<void> cache{{feature_name.pascalCase()}}s(List<{{feature_name.pascalCase()}}>? models);
  {{/is_list}}
  {{^is_list}}
  Future<BaseResponse<{{feature_name.pascalCase()}}>> getCached{{feature_name.pascalCase()}}();
  Future<void> cache{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}? model);
  {{/is_list}}
} 