import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/presentation/cubit/catalog/catalog_page.dart';
import 'package:my_shop/feature/presentation/cubit/order/create_order_cubit.dart';
import 'package:my_shop/core/error/error_page.dart';
import 'package:my_shop/feature/ui/order/order_client_info_widget.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(context.read()),
      child: const _CreateOrderPage(),
    );
  }
}

class _CreateOrderPage extends StatefulWidget {
  const _CreateOrderPage({Key? key}) : super(key: key);

  @override
  State<_CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<_CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Create Order'),
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<OrderCubit, OrderState>(
        listenWhen: (_, c) =>
            c is InitialLoadOrder ||
            c is OrderLoadSuccess ||
            c is OrderLoadingState,
        listener: (context, state) {
          if (state is OrderLoadSuccess) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const Text('Order created'),
                  content: Text('Your order ID: ${state.order?.id}'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CatalogPage(
                                      categoryId: '',
                                    ))); // Dismiss alert dialog
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialLoadOrder:
              return const ClientInfo();
            case OrderEmpty:
              return const Center(
                  child: Text(
                'Fill the Basket first!',
                style: TextStyle(fontSize: 35),
              ));
            case OrderErrorState:
              return ErrorPage(
                  refresh: () => context.read<OrderCubit>().refreshInitState());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
