import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();

class LoginEvent {
  bool isLogin;
  String nickName;
  String url;

  LoginEvent(this.isLogin, {this.nickName, this.url});
}
