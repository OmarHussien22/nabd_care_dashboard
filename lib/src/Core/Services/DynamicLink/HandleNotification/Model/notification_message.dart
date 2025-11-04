import 'package:equatable/equatable.dart';

class NotificationMessage with EquatableMixin {
  String title;
  String body;
  String image;
  String type;
  // MessageModel? message;
  // ChatModel? chat;

//<editor-fold desc="Data Methods">

  NotificationMessage({
    required this.title,
    required this.body,
    required this.image,
    required this.type,
    // this.message,
    // this.chat,
  });

  @override
  String toString() {
    return '{title: $title, body: $body, image: $image, type: $type,}';
  }

  NotificationMessage copyWith({
    String? title,
    String? body,
    String? image,
    String? type,
    // MessageModel? message,
    // ChatModel? chat,
  }) {
    return NotificationMessage(
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
      type: type ?? this.type,
      // message: message ?? this.message,
      // chat: chat ?? this.chat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'image': image,
      'type': type,
      // 'message': message != null ? jsonEncode(message?.toJson()) : null,
      // 'chat': chat != null ? jsonEncode(chat?.toJson()) : null,
    };
  }

  factory NotificationMessage.fromMap(Map<String, dynamic> map) {
    return NotificationMessage(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      image: map['image'] ?? '',
      type: map['type'] ?? 'public',
      // message: map['message'] != null
      //     ? MessageModel.fromJson(jsonDecode(map['message']))
      //     : null,
      // chat: map['chat'] != null
      //     ? ChatModel.fromJson(jsonDecode(map['chat']))
      //     : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        body,
        image,
        type,
        // message,
        // chat,
      ];
}
