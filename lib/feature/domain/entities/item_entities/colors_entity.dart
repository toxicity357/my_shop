import 'package:equatable/equatable.dart';

class ColorsEnt extends Equatable {
  const ColorsEnt({
    required this.id,
    required this.title,
    required this.code,
  });

  final int? id;
  final String? title;
  final String? code;

  @override
  List<Object?> get props => [id, title, code];
}
