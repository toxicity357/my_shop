import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/error/error_page.dart';
import 'package:my_shop/core/error/error_with_scaffold.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';
import 'package:my_shop/feature/domain/repositories/items_repository.dart';
import 'package:my_shop/feature/presentation/cubit/catalog/catalog_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_page.dart';
import 'package:my_shop/feature/presentation/cubit/catalog/category_page.dart';
import 'package:my_shop/feature/presentation/cubit/order/create_order_page.dart';
import 'package:my_shop/feature/presentation/cubit/order/order_info_page.dart';
import 'package:my_shop/feature/presentation/cubit/user_login/user_login_page.dart';
import 'package:my_shop/feature/ui/item/grid_item_cart_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key,
    this.categoryId,
  }) : super(key: key);
  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CatalogCubit(context.read<ItemsRepository>()),
        child: _CatalogPageWidget(categoryId: categoryId));
  }
}

class _CatalogPageWidget extends StatefulWidget {
  const _CatalogPageWidget({required this.categoryId});

  final String? categoryId;

  @override
  State<_CatalogPageWidget> createState() => _CatalogPageWidgetState();
}

class _CatalogPageWidgetState extends State<_CatalogPageWidget> {
  final PagingController<int, ItemsEnt> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((offset) {
      context.read<CatalogCubit>().fetchCatalog(
          offset: offset, categoryId: widget.categoryId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var padding = const EdgeInsets.all(16);
    return BlocBuilder<CatalogCubit, CatalogState>(
      buildWhen: (_, c) =>
      c is CatalogLoadSuccess || c is ErrorState || c is LoadingState,
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: BottomAppBar(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserLoginPage())),
                      icon: const Icon(Icons.logout)),
                  IconButton(
                      onPressed: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const CatalogPage(categoryId: ''))),
                      icon: const Icon(Icons.list_alt_rounded)),
                  IconButton(
                      onPressed: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BasketPage())),
                      icon: const Icon(Icons.shopping_basket_outlined)),
                  IconButton(
                      onPressed: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      context) => const CreateOrderPage())),
                      icon: const Icon(Icons.account_balance_wallet_outlined)),
                  IconButton(
                      onPressed: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OrderInfoPage())),
                      icon: const Icon(Icons.delivery_dining)),
                ],
              ),
            ),
            backgroundColor: Colors.lightGreen,
            appBar: AppBar(
              actions: [IconButton(onPressed: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryPage())),
                  icon: const Icon(Icons.filter_alt))
              ],
              title: const Text('Catalog Page'),
              backgroundColor: Colors.green,
            ),
            body: blocConsumer(padding));
      },
    );
  }

  Widget blocConsumer(EdgeInsets padding) {
    return BlocConsumer<CatalogCubit, CatalogState>(
        buildWhen: (p, c) =>
        c is CatalogLoadSuccess ||
            c is InitialLoadCatalog ||
            c is ErrorState,
        listener: (context, state) async {
          if (state is CatalogLoadSuccess) {
            if (state.loadedCatalog?.pagination!.page ==
                state.loadedCatalog?.pagination!.pages) {
              _pagingController.appendLastPage(state.loadedCatalog!.items);
            } else {
              _pagingController.appendPage(state.loadedCatalog!.items,
                  state.loadedCatalog!.pagination!.page + 1);
            }
          }
        },
        builder: (context, state) {
          var body = CupertinoScrollbar(
            child: CustomScrollView(
              slivers: [
                state is CatalogLoadSuccess
                    ? SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Divider()),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      )
                    ]))
                    : SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 10),
                      child: const CircularProgressIndicator(),
                    )),
                catalogAnswerBuilder(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
              ],
            ),
          );
          if (state is ErrorState) {
            return ErrorPage(refresh: () =>
                context.read<CatalogCubit>().fetchCatalog(
                    offset: 1, categoryId: widget.categoryId),
              );
          }
          return body;
        });
  }

  PagedSliverList<int, ItemsEnt> catalogAnswerBuilder() {
    return PagedSliverList.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<ItemsEnt>(
            noItemsFoundIndicatorBuilder: (_) => Container(),
            firstPageProgressIndicatorBuilder: (_) => Container(),
            newPageProgressIndicatorBuilder: (_) =>
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 20),
                  child: const CircularProgressIndicator(),
                ),
            itemBuilder: (BuildContext context, items, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GridItemCart(
                  items: items,
                ),
              );
            }),
        separatorBuilder: (context, index) => const SizedBox(height: 12));
  }
}
