import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class CategoryEvent {
  int id;
  String categoryName;
  String categoryImage;

  CategoryEvent(this.id, this.categoryName, this.categoryImage);
}
