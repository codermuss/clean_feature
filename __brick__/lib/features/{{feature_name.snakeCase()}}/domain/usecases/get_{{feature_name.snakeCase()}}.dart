import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/usecases/usecase.dart';
import '../entities/{{feature_name.snakeCase()}}.dart';
import '../repositories/{{feature_name.snakeCase()}}_repository.dart';

@lazySingleton
class Get{{feature_name.pascalCase()}}s implements UseCase<List<{{feature_name.pascalCase()}}>, NoParams> {
  final {{feature_name.pascalCase()}}Repository repository;

  Get{{feature_name.pascalCase()}}s(this.repository);

  @override
  Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> call(NoParams params) async {
    return await repository.get{{feature_name.pascalCase()}}s();
  }
} 