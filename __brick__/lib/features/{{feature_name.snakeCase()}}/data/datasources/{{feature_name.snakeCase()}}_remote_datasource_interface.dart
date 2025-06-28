import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}.dart';
import 'package:{{project_name}}/core/network/models/base_response.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  {{#is_list}}
  Future<BaseResponse<List<{{feature_name.pascalCase()}}>?>> get{{feature_name.pascalCase()}}s();
  {{/is_list}}
  {{^is_list}}
  Future<BaseResponse<{{feature_name.pascalCase()}}?>> get{{feature_name.pascalCase()}}();
  {{/is_list}}
} 