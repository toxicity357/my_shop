import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/presentation/cubit/basket/basket_cubit.dart';
import 'package:my_shop/feature/ui/basket/basket_widget.dart';
import 'package:my_shop/core/error/error_page.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BasketCubit(context.read()),
      child: const _BasketPage(),
    );
  }
}

class _BasketPage extends StatefulWidget {
  const _BasketPage({Key? key}) : super(key: key);

  @override
  State<_BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<_BasketPage> {
  @override
  void initState() {
    context.read<BasketCubit>().fetchBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Basket'),
          leading: IconButton(
            alignment: Alignment.centerLeft,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<BasketCubit, BasketState>(
          buildWhen: (_, c) =>
              c is BasketLoadSuccess ||
              c is BasketLoadingState ||
              c is BasketErrorState ||
              c is BasketEmpty,
          builder: (context, state) {
            if (state is BasketLoadSuccess) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return BasketWidget(
                      price: state.loadedBasket?.items[index]?.price,
                      id: state.loadedBasket?.items[index]?.item?.id,
                      quantity: state.loadedBasket?.items[index]?.quantity,
                      title: state.loadedBasket?.items[index]?.item?.title,
                      url: state
                          .loadedBasket?.items[index]?.item?.image?.file?.url,
                      colors: state.loadedBasket?.items[index]?.item?.colors);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 0,
                  color: Colors.black,
                ),
                itemCount: state.loadedBasket!.items.length,
              );
            }

            if (state is BasketEmpty) {
              return const Center(
                  child: Text(
                'Basket is Empty!',
                style: TextStyle(fontSize: 35),
              ));
            }
            if (state is BasketErrorState) {
              return ErrorPage(refresh: ()=> context.read<BasketCubit>().fetchBasket());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
