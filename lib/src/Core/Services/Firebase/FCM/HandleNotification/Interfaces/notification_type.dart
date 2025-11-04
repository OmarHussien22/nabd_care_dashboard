
import '../Model/notification_message.dart';

abstract class NotificationType {

 void onMessageArrive(NotificationMessage message);
 void onMessageTaped(NotificationMessage message);

}
