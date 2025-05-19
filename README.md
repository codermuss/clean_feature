# clean_feature Mason Brick

Generates a full feature (data, domain, presentation) for Clean Architecture + BLoC in any Dart/Flutter project.

## Usage

Add to your `mason.yaml`:

```yaml
bricks:
  clean_feature:
    git:
      url: https://github.com/YOUR_GITHUB_USERNAME/mason_bricks.git
      path: clean_feature
```

Get the brick:

```bash
mason get
```

Generate a feature:

```bash
mason make clean_feature --feature_name="map" --project_name="my_app" --features_path="lib/features"
```

- `feature_name`: The name of your feature (snake_case, e.g. `user_profile`)
- `project_name`: (Optional) Your Dart/Flutter package name for import paths
- `features_path`: (Optional) The path where features are created (default: lib/features)

## What you get
- Data, domain, and presentation layers
- BLoC, events, states, pages, widgets

## After generation
- Update import paths if needed
- Run codegen: `flutter pub run build_runner build --delete-conflicting-outputs`
- Add routes and navigation as needed

## Structure
See the brick template for full structure.

## License
MIT 