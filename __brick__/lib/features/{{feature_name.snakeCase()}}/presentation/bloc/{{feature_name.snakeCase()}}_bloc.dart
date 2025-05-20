import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_{{feature_name.snakeCase()}}.dart';
import '{{feature_name.snakeCase()}}_event.dart';
import '{{feature_name.snakeCase()}}_state.dart';

@lazySingleton
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  final Get{{feature_name.pascalCase()}}s get{{feature_name.pascalCase()}}s;

  {{feature_name.pascalCase()}}Bloc({required this.get{{feature_name.pascalCase()}}s}) : super({{feature_name.pascalCase()}}Initial()) {
    on<Load{{feature_name.pascalCase()}}s>(_onLoad{{feature_name.pascalCase()}}s);
  }

  Future<void> _onLoad{{feature_name.pascalCase()}}s(
    Load{{feature_name.pascalCase()}}s event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit({{feature_name.pascalCase()}}Loading());
    final result = await get{{feature_name.pascalCase()}}s();
    result.fold(
      (failure) => emit({{feature_name.pascalCase()}}Error(message: 'Failed to load {{feature_name.camelCase()}}s')),
      ({{feature_name.camelCase()}}s) => emit({{feature_name.pascalCase()}}Loaded({{feature_name.camelCase()}}s: {{feature_name.camelCase()}}s)),
    );
  }
} 