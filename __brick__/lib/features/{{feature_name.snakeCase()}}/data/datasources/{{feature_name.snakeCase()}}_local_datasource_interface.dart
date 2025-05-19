abstract class {{feature_name.pascalCase()}}LocalDataSource {
  Future<List<{{feature_name.pascalCase()}}Model>> getCached{{feature_name.pascalCase()}}s();
  Future<void> cache{{feature_name.pascalCase()}}s(List<{{feature_name.pascalCase()}}Model> models);
} 