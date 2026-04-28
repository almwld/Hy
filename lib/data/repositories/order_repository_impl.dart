import '../../domain/repositories/order_repository.dart';
import '../datasources/remote/order_api.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApi _orderApi;

  OrderRepositoryImpl(this._orderApi);

  @override
  Future<List<OrderModel>> getOrders() async {
    return await _orderApi.getOrders();
  }

  @override
  Future<OrderModel> createOrder(Map<String, dynamic> data) async {
    return await _orderApi.createOrder(data);
  }
}
