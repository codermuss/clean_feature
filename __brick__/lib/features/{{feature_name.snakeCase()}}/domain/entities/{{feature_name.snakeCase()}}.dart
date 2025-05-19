import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}} extends Equatable {
  final String id;
  final String name;
  final String description;

  const {{feature_name.pascalCase()}}({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, description];
} 