import 'dart:io';

import 'package:dio/dio.dart';
import '../../../interfaces/methods/get_method.dart';
import '../../../interfaces/methods/post_method.dart';
import '../handler/dio_response_handler.dart';
import '../../../utils/header_handler.dart';
import '../../../utils/network_logger.dart';
import '../../../utils/network_utils.dart';
import '../../../../../../utils/general_utils.dart';

import '../../../../../data_source/service_interface.dart';

part 'dio_get.dart';
part 'dio_post.dart';
