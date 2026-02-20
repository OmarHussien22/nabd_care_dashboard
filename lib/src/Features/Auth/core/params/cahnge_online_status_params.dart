import 'package:care_desk/src/core/network_structure/params/params.dart';


class ChangeOnlineStatusParams extends Params {
  int online;

  ChangeOnlineStatusParams({required this.online});
  @override
  Map<String, dynamic> toJson() {
    return {
      'is_online': online,
    };
  }
}
