class LocalNotificationService {
  // static final FlutterLocalNotificationsPlugin
  //     _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // static AndroidNotificationChannel channel = const AndroidNotificationChannel(
  //   'high_importance_channel', // id
  //   'High Importance Notifications', // title
  //   description:
  //       'This channel is used for important notifications.', // description
  //   importance: Importance.high,
  // );
  // void onSelectNotification(String? payload) async {
  //   printDM('payload: $payload');
  //   var payloadDecoded = json.decode(payload!);
  //   printDM('payloadDecoded: $payloadDecoded');
  //   printDM('payloadDecoded type: ${payloadDecoded['type']}');
  //   NotificationMessage message = NotificationMessage.fromMap(payloadDecoded);
  //   printDM('onSelectNotification: $message');
  //   // NotificationType notificationType =
  //   //   NotificationFactory.instance.switchType(payloadDecoded['type']);
  //   // notificationType.onMessageTaped(message);
  // }
  //
  // void localNotificationConfiguration() async {
  //   var initializationSettingsAndroid =
  //       const AndroidInitializationSettings('@mipmap/launcher_icon');
  //   // IOSInitializationSettings initializationSettingsIOS =
  //   // const IOSInitializationSettings(
  //   //   // onDidReceiveLocalNotification: (0!,"","","")
  //   // );
  //   var initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid,
  //     //  iOS: initializationSettingsIOS,
  //   );
  //   _flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     //  onSelectNotification: onSelectNotification,
  //   );
  //   await _flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  // }
  //
  // static void launchNotification({required NotificationMessage message}) {
  //   _flutterLocalNotificationsPlugin.show(
  //       0,
  //       message.title,
  //       message.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(channel.id, channel.name,
  //             channelDescription: channel.description,
  //             enableVibration: true,
  //             icon: '@mipmap/launcher_icon',
  //             priority: Priority.high,
  //             // color: AppColors.get.primary,
  //             visibility: NotificationVisibility.public),
  //         // iOS: const IOSNotificationDetails(
  //         //   presentAlert: true,
  //         //   presentBadge: true,
  //         //   presentSound: true,
  //         // ),
  //       ),
  //       // payload: json.encode('${message.toMap()}'));
  //       payload: jsonEncode(message.toMap()));
  // }
}
