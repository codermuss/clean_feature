import 'package:flutter/material.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}.dart';

class {{feature_name.pascalCase()}}ListItem extends StatelessWidget {
  final {{feature_name.pascalCase()}} {{feature_name.camelCase()}};
  final VoidCallback onTap;

  const {{feature_name.pascalCase()}}ListItem({
    required this.{{feature_name.camelCase()}},
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text({{feature_name.camelCase()}}.name),
        subtitle: Text(
          {{feature_name.camelCase()}}.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
} 