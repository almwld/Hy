import '../../../data/models/order_model.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<OrderModel> orders;
  OrdersLoaded(this.orders);
}

class OrderCreated extends OrderState {
  final OrderModel order;
  OrderCreated(this.order);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}
