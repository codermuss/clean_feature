import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/network/network_info.dart';
import '../datasources/{{feature_name.snakeCase()}}_remote_datasource_interface.dart';
import '../datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
import '../datasources/{{feature_name.snakeCase()}}_local_datasource_interface.dart';
import '../datasources/{{feature_name.snakeCase()}}_local_datasource.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

@LazySingleton(as: {{feature_name.pascalCase()}}Repository)
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{feature_name.pascalCase()}}LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  {{feature_name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> get{{feature_name.pascalCase()}}s() async {
    if (await networkInfo.isConnected) {
      try {
        final remote{{feature_name.pascalCase()}}s = await remoteDataSource.get{{feature_name.pascalCase()}}s();
        await localDataSource.cache{{feature_name.pascalCase()}}s(remote{{feature_name.pascalCase()}}s);
        return Right(remote{{feature_name.pascalCase()}}s);
      } catch (e) {
        // TODO: Handle error
        return Left(ServerFailure());
      }
    } else {
      try {
        final cached = await localDataSource.getCached{{feature_name.pascalCase()}}s();
        return Right(cached);
      } catch (e) {
        return Left(NetworkFailure());
      }
    }
  }
} 