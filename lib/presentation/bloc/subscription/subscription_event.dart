abstract class SubscriptionEvent {}

class GetSubscriptionsEvent extends SubscriptionEvent {}
class SubscribeEvent extends SubscriptionEvent {
  final String planId;
  SubscribeEvent(this.planId);
}
