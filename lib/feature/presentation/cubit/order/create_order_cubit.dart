import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/data/data_sources/constants.dart';
import 'package:my_shop/feature/domain/entities/order_entities/order_entities.dart';
import 'package:my_shop/feature/domain/repositories/order_repository.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderLoadingState extends OrderState {
  const OrderLoadingState();
}

class OrderEmpty extends OrderState {
  const OrderEmpty();
}

class OrderErrorState extends OrderState {
  const OrderErrorState();
}

class InitialLoadOrder extends OrderState {
  const InitialLoadOrder();
}

class OrderLoadSuccess extends OrderState {
  const OrderLoadSuccess({required this.order});

  final OrderEnt? order;

  @override
  List<Object?> get props => [order];
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepository) : super(const InitialLoadOrder());
  final OrderRepository orderRepository;

  void refreshInitState(){
    emit(InitialLoadOrder());
  }

  Future<OrderEnt?> fetchOrder({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String comment,
  }) async {
    emit(const OrderLoadingState());

    try {
      if (respBasketProducts.isNotEmpty) {
        final createdOrder = await orderRepository.createOrder(
            name: name,
            address: address,
            phone: phone,
            email: email,
            comment: comment);

        respBasketProducts.clear();

        emit(OrderLoadSuccess(order: createdOrder));
      } else {
        emit(const OrderEmpty());
      }
    } catch (e) {
      emit(const OrderErrorState());
    }
  }
}
