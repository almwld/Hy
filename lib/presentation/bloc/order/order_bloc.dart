import 'package:flutter_bloc/flutter_bloc.dart';

abstract class OrderState {}
class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderLoaded extends OrderState {
  final List<Map<String, dynamic>> orders;
  OrderLoaded(this.orders);
}
class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}

class OrderBloc extends Cubit<OrderState> {
  OrderBloc() : super(OrderInitial());
  
  Future<void> loadOrders() async {
    emit(OrderLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(OrderLoaded([]));
  }
}
