abstract class SubscriptionState {}

class SubscriptionInitial extends SubscriptionState {}
class SubscriptionLoading extends SubscriptionState {}
class SubscriptionsLoaded extends SubscriptionState {
  final List<dynamic> subscriptions;
  SubscriptionsLoaded(this.subscriptions);
}
class SubscriptionSuccess extends SubscriptionState {}
class SubscriptionError extends SubscriptionState {
  final String message;
  SubscriptionError(this.message);
}
