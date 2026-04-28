abstract class OrderEvent {}

class GetOrdersEvent extends OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  final Map<String, dynamic> data;
  CreateOrderEvent(this.data);
}
