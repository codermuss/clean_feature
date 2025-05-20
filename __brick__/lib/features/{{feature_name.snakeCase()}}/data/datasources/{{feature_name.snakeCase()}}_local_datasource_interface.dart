import '../models/{{feature_name.snakeCase()}}_model.dart';

abstract class {{feature_name.pascalCase()}}LocalDataSource {
  {{#is_list}}
  Future<List<{{feature_name.pascalCase()}}Model>> getCached{{feature_name.pascalCase()}}s();
  Future<void> cache{{feature_name.pascalCase()}}s(List<{{feature_name.pascalCase()}}Model> models);
  {{/is_list}}
  {{^is_list}}
  Future<{{feature_name.pascalCase()}}Model> getCached{{feature_name.pascalCase()}}();
  Future<void> cache{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Model model);
  {{/is_list}}
} 