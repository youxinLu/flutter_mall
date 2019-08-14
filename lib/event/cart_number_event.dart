import 'package:event_bus/event_bus.dart';

EventBus cartNumberEventBus = EventBus();

class CartNumberEvent {
  var number;

  CartNumberEvent(this.number);
}
