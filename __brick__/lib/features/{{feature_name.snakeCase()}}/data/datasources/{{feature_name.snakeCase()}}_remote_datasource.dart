import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/network/http_client/iw_http_client.dart';
import 'package:{{project_name}}/core/network/models/base_response.dart';
import 'package:{{project_name}}/core/utils/constants/endpoints.dart';
import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}.dart';
import './{{feature_name.snakeCase()}}_remote_datasource_interface.dart';

@LazySingleton(as: {{feature_name.pascalCase()}}RemoteDataSource)
class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}RemoteDataSource {
  final IWHttpClient iwHttpClient;

  {{feature_name.pascalCase()}}RemoteDataSourceImpl({required this.iwHttpClient});

  {{#is_list}}
  // TODO: Update endpoint
  @override
  Future<BaseResponse<List<{{feature_name.pascalCase()}}>?>> get{{feature_name.pascalCase()}}s() async => await iwHttpClient.fetch<{{feature_name.pascalCase()}},List<{{feature_name.pascalCase()}}>>(path: Endpoints.{{feature_name.camelCase()}});
  {{/is_list}}
  {{^is_list}}
  @override
  Future<BaseResponse<{{feature_name.pascalCase()}}?>> get{{feature_name.pascalCase()}}() async => await iwHttpClient.fetch<{{feature_name.pascalCase()}},{{feature_name.pascalCase()}}>(path: Endpoints.{{feature_name.camelCase()}});
  {{/is_list}}
} 