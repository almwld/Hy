import 'package:flutter_bloc/flutter_bloc.dart';
import 'subscription_event.dart';
import 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionInitial()) {
    on<GetSubscriptionsEvent>(_onGetSubscriptions);
    on<SubscribeEvent>(_onSubscribe);
  }

  Future<void> _onGetSubscriptions(GetSubscriptionsEvent event, Emitter<SubscriptionState> emit) async {
    emit(SubscriptionLoading());
    try {
      emit(SubscriptionsLoaded([]));
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }

  Future<void> _onSubscribe(SubscribeEvent event, Emitter<SubscriptionState> emit) async {
    emit(SubscriptionLoading());
    try {
      emit(SubscriptionSuccess());
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }
}
