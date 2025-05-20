import 'package:dartz/dartz.dart';
import '../entities/{{feature_name.snakeCase()}}.dart';
import 'package:{{project_name}}/core/error/failures.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> get{{feature_name.pascalCase()}}s();
} 