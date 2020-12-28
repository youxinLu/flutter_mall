import 'package:event_bus/event_bus.dart';

/**
 * Create by luyouxin
 * description
    Created by $USER_NAME on 2020/10/21.
 */
EventBus tabSelectBus = EventBus();

class TabSelectEvent {
  int selectIndex;

  TabSelectEvent(this.selectIndex);
}
