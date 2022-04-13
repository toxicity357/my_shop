import 'package:flutter/material.dart';
import 'package:my_shop/feature/domain/entities/category_entities/category_items_entity.dart';
import 'package:my_shop/feature/presentation/cubit/catalog/catalog_page.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.category}) : super(key: key);
  final CategoryItemsEnt category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(37),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
        ),
        child: Text(
          '${category.title}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CatalogPage(categoryId: '${category.id}'))),
    );
  }
}
