import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/domain/repositories/items_repository.dart';
import 'package:my_shop/core/error/error_page.dart';
import 'package:my_shop/feature/ui/item/category_widget.dart';

import 'catalog_cubit.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogCubit(context.read<ItemsRepository>()),
      child: const _CategoryPage(),
    );
  }
}

class _CategoryPage extends StatefulWidget {
  const _CategoryPage({Key? key}) : super(key: key);
  @override
  State<_CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<_CategoryPage> {
  @override
  void initState() {
    context.read<CatalogCubit>().fetchCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Choose Category'),
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<CatalogCubit, CatalogState>(
          builder: (context, state){
            if (state is CategoryLoadSuccess){
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return CategoryWidget(category: state.loadedCategory!.items![index]!);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 0,
                  color: Colors.black,
                ),
                itemCount: state.loadedCategory!.items!.length,
              );
            }
            if (state is ErrorState){
              return ErrorPage(refresh: ()=> context.read<CatalogCubit>().fetchCategory());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          ),
    );
  }
}

