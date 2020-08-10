import 'package:event_bus/event_bus.dart';
import 'package:mall/entity/address_entity.dart';


EventBus bus=EventBus();

class AddressDataEvent{
  ListData addressData;

  AddressDataEvent(this.addressData);
}