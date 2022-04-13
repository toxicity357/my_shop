import 'package:equatable/equatable.dart';

class FileEnt extends Equatable{
  const FileEnt({
    required this.url,
  required this.name,
  required this.originalName,
  required this.extension,
  required this.size
});
  final String? url;
  final String? name;
  final String? originalName;
  final String? extension;
  final String? size;

  @override
  List<Object?> get props => [url, name, originalName, extension, size];
}