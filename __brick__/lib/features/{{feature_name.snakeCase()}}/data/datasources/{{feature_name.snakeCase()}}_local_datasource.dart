import './{{feature_name.snakeCase()}}_local_datasource_interface.dart';
import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}.dart';
import 'package:{{project_name}}/core/network/models/base_response.dart';
import 'package:{{project_name}}/core/storage/model/cache_orchestration.dart';
import 'package:{{project_name}}/core/storage/model/cache_box_names.dart';
import 'package:{{project_name}}/core/storage/model/cache_ttl.dart';
import 'package:{{project_name}}/core/storage/model/exceptions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: {{feature_name.pascalCase()}}LocalDataSource)
class {{feature_name.pascalCase()}}LocalDataSourceImpl implements {{feature_name.pascalCase()}}LocalDataSource {
  final CacheOrchestration _cacheOrchestration;
  {{feature_name.pascalCase()}}LocalDataSourceImpl(this._cacheOrchestration);
  {{#is_list}}
  @override
  Future<BaseResponse<List<{{feature_name.pascalCase()}}>>> getCached{{feature_name.pascalCase()}}s() async {
      try {
      final cache = _cacheOrchestration.getAll<{{feature_name.pascalCase()}}>(
        CacheBoxNames.{{feature_name.camelCase()}},
      );

      return BaseResponse.success(
        data: cache.data.toList(),
        cacheEntity: cache.cacheEntity,
      );
    } catch (e) {
      return BaseResponse.clientError(error:e);
    }
  }

  @override
  Future<void> cache{{feature_name.pascalCase()}}s(List<{{feature_name.pascalCase()}}>? models) async {
    if(models!=null){
        try {
          // Clear existing data
          await _cacheOrchestration.clear(CacheBoxNames.{{feature_name.camelCase()}});

          final Map<String, {{feature_name.pascalCase()}}> {{feature_name.snakeCase()}}Map = {
            for ({{feature_name.pascalCase()}} {{feature_name.camelCase()}} in models) {{feature_name.camelCase()}}.id ?? '': {{feature_name.camelCase()}},
          };

          await _cacheOrchestration.putAll(
            boxName: CacheBoxNames.{{feature_name.camelCase()}},
            items: {{feature_name.snakeCase()}}Map,
            ttl: CacheTtl.short,
          );
        } catch (e) {
          throw CacheException('Failed to cache {{feature_name.pascalCase()}}s: $e');
        }
    }
  }
  {{/is_list}}
  {{^is_list}}
  @override
  Future<BaseResponse<{{feature_name.pascalCase()}}>> getCached{{feature_name.pascalCase()}}() async {
    try {
      final cache = _cacheOrchestration.get<{{feature_name.pascalCase()}}>(
        CacheBoxNames.{{feature_name.camelCase()}},
      );
        return BaseResponse.success(
        data: cache.data,
        cacheEntity: cache.cacheEntity,
      );
    } catch (e) {
      return BaseResponse.clientError(error:e);
    }
  }

  @override
  Future<void> cache{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}? model) async {
    try {
      // Clear existing data
      await _cacheOrchestration.clear(CacheBoxNames.{{feature_name.camelCase()}});

      await _cacheOrchestration.put(
        valueKey: model?.id??'',
        value: model,
        boxName: CacheBoxNames.{{feature_name.camelCase()}},
        ttl: CacheTtl.short,
      );
    } catch (e) {
      throw CacheException('Failed to cache {{feature_name.pascalCase()}}s: $e');
    }
  }
  {{/is_list}}
} 