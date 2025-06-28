import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/utils/helpers/repository_helper.dart';
import 'package:{{project_name}}/core/network/info/network_info.dart';
import 'package:{{project_name}}/core/network/models/base_response.dart';
import '../datasources/{{feature_name.snakeCase()}}_remote_datasource_interface.dart';
import '../datasources/{{feature_name.snakeCase()}}_local_datasource_interface.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';


@LazySingleton(as: {{feature_name.pascalCase()}}Repository)
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{feature_name.pascalCase()}}LocalDataSource localDataSource;
  final RepositoryHelper repositoryHelper;

  {{feature_name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource, 
    required this.localDataSource, 
    required NetworkInfo networkInfo,
  }) : repositoryHelper = RepositoryHelper(networkInfo: networkInfo);

  {{#is_list}}
  @override
  Future<BaseResponse<List<{{feature_name.pascalCase()}}>?>> get{{feature_name.pascalCase()}}s() async {
    return repositoryHelper.fetchData<List<{{feature_name.pascalCase()}}>>(
      fetchFromRemote: remoteDataSource.get{{feature_name.pascalCase()}}s,
      fetchFromLocal: () => localDataSource.getCached{{feature_name.pascalCase()}}s(),
      saveToLocal:localDataSource.cache{{feature_name.pascalCase()}}s,
    );
  }
  {{/is_list}}
  {{^is_list}}
  @override
  Future<BaseResponse<{{feature_name.pascalCase()}}?>> get{{feature_name.pascalCase()}}() async {
    return repositoryHelper.fetchData<{{feature_name.pascalCase()}}>(
      fetchFromRemote: remoteDataSource.get{{feature_name.pascalCase()}},
      fetchFromLocal: localDataSource.getCached{{feature_name.pascalCase()}},
      saveToLocal: localDataSource.cache{{feature_name.pascalCase()}},
    );
  }
  {{/is_list}}
}