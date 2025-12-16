import 'dart:io';

import 'package:dio/dio.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/src/Interfaces/Methods/get_method.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/src/Interfaces/Methods/post_method.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/src/Resources/DioService/Handler/dio_response_handler.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/src/Utils/header_handler.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/src/Utils/network_logger.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/src/Utils/network_utils.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

part 'dio_get.dart';
part 'dio_post.dart';
