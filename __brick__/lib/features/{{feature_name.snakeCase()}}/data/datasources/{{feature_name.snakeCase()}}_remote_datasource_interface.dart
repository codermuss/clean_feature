import '../models/{{feature_name.snakeCase()}}_model.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  {{#is_list}}
  Future<List<{{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}s();
  {{/is_list}}
  {{^is_list}}
  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}();
  {{/is_list}}
} 