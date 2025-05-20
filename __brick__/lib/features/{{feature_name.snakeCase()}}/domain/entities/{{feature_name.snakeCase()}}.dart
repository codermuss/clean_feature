import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}} extends Equatable {
  final String id;

  const {{feature_name.pascalCase()}}({required this.id});

  @override
  List<Object?> get props => [id];
} 