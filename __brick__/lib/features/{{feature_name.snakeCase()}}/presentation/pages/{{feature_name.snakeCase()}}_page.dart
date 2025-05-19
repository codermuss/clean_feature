import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/{{feature_name.snakeCase()}}_bloc.dart';
import '../bloc/{{feature_name.snakeCase()}}_event.dart';
import '../bloc/{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  const {{feature_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.titleCase()}}s'),
      ),
      body: BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
        builder: (context, state) {
          if (state is {{feature_name.pascalCase()}}Initial) {
            context.read<{{feature_name.pascalCase()}}Bloc>().add(Load{{feature_name.pascalCase()}}s());
            return const Center(child: CircularProgressIndicator());
          } else if (state is {{feature_name.pascalCase()}}Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is {{feature_name.pascalCase()}}Loaded) {
            return ListView.builder(
              itemCount: state.{{feature_name.camelCase()}}s.length,
              itemBuilder: (context, index) {
                final {const {feature_name.camelCase()}} = state.{{feature_name.camelCase()}}s[index];
                return ListTile(
                  title: Text({{feature_name.camelCase()}}.name),
                  subtitle: Text({{feature_name.camelCase()}}.description),
                  onTap: () {
                    // TODO: Add navigation or detail logic
                  },
                );
              },
            );
          } else if (state is {{feature_name.pascalCase()}}Error) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
} 