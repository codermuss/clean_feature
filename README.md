# 🧱 clean_feature Mason Brick

Generate a full Clean Architecture feature (data, domain, presentation) with BLoC for any Dart/Flutter project. Fast, opinionated, and extensible.

## 🚀 Quick Start

1. **Add to your `mason.yaml`:**
    ```yaml
    bricks:
      clean_feature:
        git:
          url: https://github.com/codermuss/clean_feature.git
    ```

2. **Get the brick:**
    ```bash
    mason get
    ```

3. **Generate a feature:**
    ```bash
    mason make clean_feature --feature_name="user_profile" --project_name="my_app" --features_path="lib/features"
    ```

    - `feature_name` (required): Feature name in snake_case (e.g. `user_profile`)
    - `project_name` (optional): Your Dart/Flutter package name for imports
    - `features_path` (optional): Path for features (default: `lib/features`)
    - `is_list` (optional): Use a list model? (default: true)

## 🏗️ What You Get

- **Layered structure:** Data, Domain, Presentation
- **BLoC:** Events, States, Bloc, View, Widgets
- **Router:** GoRouter integration
- **Codegen ready:** Uses `json_serializable` and `hive` for models

## 📁 Generated Structure
```
lib/
└── features/
    └── user_profile/
        ├── data/
        │   ├── datasources/
        │   │   ├── user_profile_local_datasource.dart
        │   │   ├── user_profile_local_datasource_interface.dart
        │   │   ├── user_profile_remote_datasource.dart
        │   │   └── user_profile_remote_datasource_interface.dart
        │   ├── models/
        │   │   └── user_profile_model.dart
        │   └── repositories/
        │       └── user_profile_repository_impl.dart
        ├── domain/
        │   ├── entities/
        │   │   └── user_profile.dart
        │   ├── repositories/
        │   │   └── user_profile_repository.dart
        │   └── usecases/
        │       └── get_user_profile.dart
        ├── presentation/
        │   ├── bloc/
        │   │   ├── user_profile_bloc.dart
        │   │   ├── user_profile_event.dart
        │   │   └── user_profile_state.dart
        │   ├── views/
        │   │   └── user_profile_view.dart
        │   └── widgets/
        │       └── user_profile_list_item.dart
        └── router/
            └── user_profile_route.dart
```


## 🛠️ After Generation

- **Update endpoints/imports** as needed
- **Run codegen** for models:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
- **Add routes** to your app's router
- **Implement your feature logic** in the generated files

## 🧩 Customization

- **`is_list`**: Prompted on generation, controls if the feature is a list or single entity
- **All files are ready for dependency injection (`injectable`)**
- **Models** use `json_serializable` and `hive` (see generated `.g.dart` files)

## 🐞 Troubleshooting

- If you see missing `.g.dart` files, run codegen as above
- If imports break, check your `project_name` and `features_path`
- For advanced customization, edit the brick or open an issue