import 'package:equatable/equatable.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';

abstract class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State {}

class {{feature_name.pascalCase()}}Loading extends {{feature_name.pascalCase()}}State {}

class {{feature_name.pascalCase()}}Loaded extends {{feature_name.pascalCase()}}State {
  final List<{{feature_name.pascalCase()}}> {{feature_name.camelCase()}}s;

  const {{feature_name.pascalCase()}}Loaded({required this.{{feature_name.camelCase()}}s});

  @override
  List<Object> get props => [{{feature_name.camelCase()}}s];
}

class {{feature_name.pascalCase()}}Error extends {{feature_name.pascalCase()}}State {
  final String message;

  const {{feature_name.pascalCase()}}Error({required this.message});

  @override
  List<Object> get props => [message];
} 