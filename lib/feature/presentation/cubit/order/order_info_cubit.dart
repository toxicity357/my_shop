import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/feature/domain/entities/order_entities/order_entities.dart';
import 'package:my_shop/feature/domain/repositories/order_repository.dart';

abstract class OrderInfoState extends Equatable {
  const OrderInfoState();

  @override
  List<Object?> get props => [];
}

class OrderInfoLoadingState extends OrderInfoState {
  const OrderInfoLoadingState();
}

class OrderInfoErrorState extends OrderInfoState {
  const OrderInfoErrorState();
}

class InitialOrderInfoState extends OrderInfoState {
  const InitialOrderInfoState();
}

class OrderIdFieldEmpty extends OrderInfoState {
  const OrderIdFieldEmpty();
}

class OrderInfoLoadSuccess extends OrderInfoState {
  const OrderInfoLoadSuccess({required this.orderInfo});

  final OrderEnt? orderInfo;

  @override
  List<Object?> get props => [orderInfo];
}

class OrderInfoCubit extends Cubit<OrderInfoState> {
  OrderInfoCubit(this.orderRepository) : super(const InitialOrderInfoState());
  final OrderRepository orderRepository;

  Future<OrderEnt?> fetchOrderInfo({
    required String orderId,
  }) async {
    emit(const OrderInfoLoadingState());
    try {
      if (orderId != '') {
        final receivedOrderInfo = await orderRepository.getOrderInfo(
          orderId: orderId,
        );
        emit(OrderInfoLoadSuccess(orderInfo: receivedOrderInfo));
      } else {
        emit(const OrderIdFieldEmpty());
      }
    } catch (e) {
      emit(const OrderInfoErrorState());
    }
  }
}
