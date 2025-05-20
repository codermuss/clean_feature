import 'package:equatable/equatable.dart';
import 'package:{{project_name}}/core/bloc/base_states.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';

abstract class {{feature_name.pascalCase()}}State extends Equatable implements BaseState {
  const {{feature_name.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State implements BaseInitial {}

class {{feature_name.pascalCase()}}Loading extends {{feature_name.pascalCase()}}State implements BaseLoading {}

class {{feature_name.pascalCase()}}Loaded extends {{feature_name.pascalCase()}}State implements BaseLoaded {
  final List<{{feature_name.pascalCase()}}> {{feature_name.camelCase()}}s;

  const {{feature_name.pascalCase()}}Loaded({required this.{{feature_name.camelCase()}}s});

  @override
  List<Object> get props => [{{feature_name.camelCase()}}s];
}

class {{feature_name.pascalCase()}}Error extends {{feature_name.pascalCase()}}State implements BaseError {
  final String message;

  const {{feature_name.pascalCase()}}Error({required this.message});

  @override
  List<Object> get props => [message];
} 