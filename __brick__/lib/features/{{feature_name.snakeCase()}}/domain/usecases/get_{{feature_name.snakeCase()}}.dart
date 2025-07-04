import 'package:injectable/injectable.dart';
import 'package:{{project_name}}/core/base/usecases/usecase.dart';
import 'package:{{project_name}}/core/network/models/base_response.dart';
import '../entities/{{feature_name.snakeCase()}}.dart';
import '../repositories/{{feature_name.snakeCase()}}_repository.dart';

@lazySingleton
class Get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}} implements NoParamUseCase<{{#is_list}}List<{{feature_name.pascalCase()}}>{{/is_list}}{{^is_list}}{{feature_name.pascalCase()}}{{/is_list}}?> {
  final {{feature_name.pascalCase()}}Repository repository;

  Get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}}(this.repository);

  @override
  Future<BaseResponse<{{#is_list}}List<{{feature_name.pascalCase()}}>{{/is_list}}{{^is_list}}{{feature_name.pascalCase()}}{{/is_list}}?>> call() async {
    return await repository.get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}}();
  }
} 
