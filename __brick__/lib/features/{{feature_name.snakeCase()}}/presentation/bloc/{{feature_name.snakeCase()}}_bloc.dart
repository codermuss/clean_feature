import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_{{feature_name.snakeCase()}}.dart';
import '{{feature_name.snakeCase()}}_event.dart';
import '{{feature_name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/core/utils/helpers/consol_log_helper.dart';

@injectable
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  final Get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}} get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}};

  {{feature_name.pascalCase()}}Bloc({required this.get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}}}) : super({{feature_name.pascalCase()}}Initial()) {
    on<{{feature_name.pascalCase()}}LoadEvent>(_onLoad{{feature_name.pascalCase()}});
  }

  Future<void> _onLoad{{feature_name.pascalCase()}}(
    {{feature_name.pascalCase()}}LoadEvent event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit({{feature_name.pascalCase()}}Loading());
    final result = await get{{feature_name.pascalCase()}}{{#is_list}}s{{/is_list}}();
    result.when(
      success: (requestId, data, message, metadata, headers, cacheEntity) {
        emit(
          data == null
              ? {{feature_name.pascalCase()}}Empty()
              : {{feature_name.pascalCase()}}Loaded({{feature_name.camelCase()}}{{#is_list}}s{{/is_list}}: data),
        );
      },
      message: (requestId, message, metadata, headers) {
        logInfo(message.text ?? 'message');
      },
      clientError:
          (requestId, errorType, statusCode, rawError, metadata, headers) {
            emit({{feature_name.pascalCase()}}Error(message: '$rawError'));
          },
      backendError: (requestId, metadata, headers) {
        emit({{feature_name.pascalCase()}}Error(message: '$requestId'));
      },
    );
  }
} 