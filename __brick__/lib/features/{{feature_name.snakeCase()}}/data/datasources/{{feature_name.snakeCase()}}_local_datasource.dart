import './{{feature_name.snakeCase()}}_local_datasource_interface.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: {{feature_name.pascalCase()}}LocalDataSource)
class {{feature_name.pascalCase()}}LocalDataSourceImpl implements {{feature_name.pascalCase()}}LocalDataSource {
  // You can inject a storage service here (e.g. SharedPreferences, Hive, etc.)

  {{#is_list}}
  @override
  Future<List<{{feature_name.pascalCase()}}Model>> getCached{{feature_name.pascalCase()}}s() async {
    // TODO: Implement local cache fetch
    throw UnimplementedError();
  }

  @override
  Future<void> cache{{feature_name.pascalCase()}}s(List<{{feature_name.pascalCase()}}Model> models) async {
    // TODO: Implement local cache save
    throw UnimplementedError();
  }
  {{/is_list}}
  {{^is_list}}
  @override
  Future<{{feature_name.pascalCase()}}Model> getCached{{feature_name.pascalCase()}}() async {
    // TODO: Implement local cache fetch
    throw UnimplementedError();
  }

  @override
  Future<void> cache{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Model model) async {
    // TODO: Implement local cache save
    throw UnimplementedError();
  }
  {{/is_list}}
} 