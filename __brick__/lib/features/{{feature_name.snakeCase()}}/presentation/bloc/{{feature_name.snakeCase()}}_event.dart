import 'package:equatable/equatable.dart';

abstract class {{feature_name.pascalCase()}}Event extends Equatable {
  const {{feature_name.pascalCase()}}Event();

  @override
  List<Object> get props => [];
}

class {{feature_name.pascalCase()}}LoadEvent extends {{feature_name.pascalCase()}}Event {} 