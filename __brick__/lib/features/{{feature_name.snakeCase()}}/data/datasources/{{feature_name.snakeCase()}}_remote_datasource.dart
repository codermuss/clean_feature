import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/network/dio_client.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';
import 'package:{{project_name}}/core/constants/endpoints.dart';
import './{{feature_name.snakeCase()}}_remote_datasource_interface.dart';

@LazySingleton(as: {{feature_name.pascalCase()}}RemoteDataSource)
class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}RemoteDataSource {
  final DioClient dioClient;

  {{feature_name.pascalCase()}}RemoteDataSourceImpl({required this.dioClient});

  {{#is_list}}
  @override
  Future<List<{{feature_name.pascalCase()}}Model>> get{{feature_name.pascalCase()}}s() async {
    // TODO: Update endpoint
    final response = await dioClient.get(Endpoints.{{feature_name.camelCase()}});
    final data = response.data['data'] as List;
    return data.map((json) => {{feature_name.pascalCase()}}Model.fromJson(json)).toList();
  }
  {{/is_list}}
  {{^is_list}}
  @override
  Future<{{feature_name.pascalCase()}}Model> get{{feature_name.pascalCase()}}() async {
    // TODO: Update endpoint
    final response = await dioClient.get(Endpoints.{{feature_name.camelCase()}});
    return {{feature_name.pascalCase()}}Model.fromJson(response.data['data']);
  }
  {{/is_list}}
} 