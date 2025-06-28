import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/{{feature_name.snakeCase()}}_bloc.dart';
import '../bloc/{{feature_name.snakeCase()}}_event.dart';
import '../bloc/{{feature_name.snakeCase()}}_state.dart';
import 'package:{{project_name}}/core/di/injection.dart';
import 'package:{{project_name}}/core/presentation/widgets/auto_bloc_state_builder.dart';
import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/domain/entities/{{feature_name.snakeCase()}}.dart';
import '../widgets/{{feature_name.snakeCase()}}_list_item.dart';

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{feature_name.pascalCase()}}Bloc>(),
      child: const _{{feature_name.pascalCase()}}Body(),
    );
  }
}

class _{{feature_name.pascalCase()}}Body extends StatelessWidget {
  const _{{feature_name.pascalCase()}}Body();

  @override
  Widget build(BuildContext context) {
    return AutoBlocStateBuilder<
      {{feature_name.pascalCase()}}Bloc,
      {{feature_name.pascalCase()}}State,
      {{#is_list}}List<{{feature_name.pascalCase()}}>{{/is_list}}{{^is_list}}{{feature_name.pascalCase()}}{{/is_list}},
      {{feature_name.pascalCase()}}Event>(
      loadEvent: {{feature_name.pascalCase()}}LoadEvent(),
      onSuccess: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text('{{feature_name.pascalCase()}}'),
          ),
          body: {{#is_list}}
            ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final {{feature_name.camelCase()}} = data[index];
                return {{feature_name.pascalCase()}}ListItem(
                  {{feature_name.camelCase()}}: {{feature_name.camelCase()}},
                  onTap: () {
                    print('${{{feature_name.camelCase()}}.id} was tapped');
                  }
                );
              },
            )
          {{/is_list}}
          {{^is_list}}
            {{feature_name.pascalCase()}}ListItem(
              {{feature_name.camelCase()}}: data,
              onTap: () {
                print('${data.id} was tapped');
              },
            )
          {{/is_list}}
        );
      },
    );
  }
}