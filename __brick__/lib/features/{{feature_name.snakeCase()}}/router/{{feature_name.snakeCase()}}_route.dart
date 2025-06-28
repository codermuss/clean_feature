import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/core/config/router/app_route_paths.dart';
import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/presentation/views/{{feature_name.snakeCase()}}_view.dart';

GoRoute {{feature_name.camelCase()}}Route = GoRoute(
  path: AppRoutePaths.{{feature_name.camelCase()}},
  name: AppRoutePaths.{{feature_name.camelCase()}},
  pageBuilder: (context, state) => const MaterialPage(child: {{feature_name.pascalCase()}}View()),
);