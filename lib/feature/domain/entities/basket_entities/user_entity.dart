import 'package:equatable/equatable.dart';

class UserEnt extends Equatable {
  const UserEnt({required this.id, required this.accessKey});

  final int? id;
  final String? accessKey;

  @override
  List<Object?> get props => [id, accessKey];
}