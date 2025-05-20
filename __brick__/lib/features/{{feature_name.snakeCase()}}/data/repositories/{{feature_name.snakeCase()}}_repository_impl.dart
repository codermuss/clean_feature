import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/network/network_info.dart';
import 'package:{{project_name}}/core/repository/repository_helper.dart';
import '../datasources/{{feature_name.snakeCase()}}_remote_datasource_interface.dart';
import '../datasources/{{feature_name.snakeCase()}}_local_datasource_interface.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';


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

  @override
  Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> get{{feature_name.pascalCase()}}s() async {
    return repositoryHelper.fetchData<List<{{feature_name.pascalCase()}}Model>>(
      fetchFromRemote: () => remoteDataSource.get{{feature_name.pascalCase()}}s(),
      fetchFromLocal: () => localDataSource.getCached{{feature_name.pascalCase()}}s(),
      saveToLocal: (data) => localDataSource.cache{{feature_name.pascalCase()}}s(data),
    );
  }
}