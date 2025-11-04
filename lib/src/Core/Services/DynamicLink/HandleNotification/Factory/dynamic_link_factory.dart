import 'package:getx_base_code/src/Core/Services/DynamicLink/HandleNotification/Interfaces/dynamic_link_type.dart';

import '../Implementation/general_dynamic_link.dart';

class DynamicLinkFactory {
  DynamicLinkFactory._();

  static DynamicLinkFactory instance = DynamicLinkFactory._();
  //path
  final Map<String, DynamicLinkType> _map = {
    '/general': GeneralDynamicLink.instance,
  };

  DynamicLinkType switchType(String value) {
    return _map[value] ?? GeneralDynamicLink.instance;
  }
}
