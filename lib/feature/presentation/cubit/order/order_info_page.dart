import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/presentation/cubit/catalog/catalog_page.dart';
import 'package:my_shop/feature/ui/order/created_order_widget.dart';
import 'package:my_shop/feature/ui/order/order_id_field_widget.dart';
import 'package:my_shop/feature/ui/order/ordered_items_widget.dart';

import 'order_info_cubit.dart';

class OrderInfoPage extends StatelessWidget {
  const OrderInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderInfoCubit(context.read()),
      child: const _OrderInfoPage(),
    );
  }
}

class _OrderInfoPage extends StatefulWidget {
  const _OrderInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<_OrderInfoPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<_OrderInfoPage> {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CatalogPage(categoryId: '',))); // Di
            },
          ),
        ),
        body: BlocConsumer<OrderInfoCubit, OrderInfoState>(
            listenWhen: (_, c) =>
            c is OrderIdFieldEmpty ||
                c is OrderInfoLoadSuccess ||
                c is OrderInfoErrorState,
            listener: (context, state) {
              if (state is OrderIdFieldEmpty) {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Order ID is empty!'),
                      content: const Text('Enter order ID'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderInfoPage()));
                          },
                        ),
                      ],
                    );
                  },
                );
              }
              if (state is OrderInfoErrorState){
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text('Wrong order ID!'),
                      content: const Text('Check your order ID and try again'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderInfoPage()));
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            builder: (context, state) {
                if (state is InitialOrderInfoState) {
                  return const OrderIdField();
                }
                if (state is OrderInfoLoadSuccess) {
                  return Column(
                    children: [
                      CreatedOrderWidget(
                          orderId:state.orderInfo!.id!,
                          status:state.orderInfo!.status!.title!,
                          totalPrice: state.orderInfo!.totalPrice!,
                         ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return OrderedItemsWidget(
                            id: state.orderInfo?.basket?.items[index]?.id,
                            quantity: state.orderInfo?.basket?.items[index]?.quantity,
                            title: state.orderInfo?.basket?.items[index]?.item?.title,
                            url: state.orderInfo?.basket?.items[index]?.item?.image?.file?.url,
                            price: state.orderInfo?.basket?.items[index]?.item?.price,
                            colors: state.orderInfo?.basket?.items[index]?.item?.colors,
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                          height: 0,
                          color: Colors.black,
                        ),
                        itemCount: state.orderInfo!.basket!.items.length,
                      ),
                    ],
                  );
                }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
