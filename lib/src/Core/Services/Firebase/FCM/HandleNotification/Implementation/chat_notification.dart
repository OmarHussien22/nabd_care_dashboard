import 'package:care_desk/src/Core/routers/go_router/app_go_router.dart';

import '../Interfaces/notification_type.dart';
import '../Model/notification_message.dart';

class ChatNotification extends NotificationType {
  ChatNotification._();
  static final ChatNotification instance = ChatNotification._();
  @override
  onMessageArrive(NotificationMessage message) {
    // printDM('onMessageArrive ${message.message}');
    // printDM('onMessageArrive 2 ${message}');
    // MessagesHandler.instance
    //     .addMessage(message: message.message!, chat: message.chat!);
    // MessagesHandler.instance.handleLaunchNotification(message);
  }

  @override
  void onMessageTaped(NotificationMessage message) {

    // Snap.to(ChatsPage());
    // Snap.to(MessagesPage(chat: message.chat!));
  }
}
