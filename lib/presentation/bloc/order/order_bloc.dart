import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<List<Map<String, dynamic>>> {
  OrderBloc() : super([]);
  
  Future<void> loadOrders() async {
    await Future.delayed(const Duration(seconds: 1));
    emit([]);
  }
}
