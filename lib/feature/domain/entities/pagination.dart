import 'package:equatable/equatable.dart';

class Pagination extends Equatable{
const Pagination({
  required this.total, required this.page, required this.pages});
final int page;
final int pages;
final int total;

  @override
  List<Object?> get props => [page, pages, total];


}