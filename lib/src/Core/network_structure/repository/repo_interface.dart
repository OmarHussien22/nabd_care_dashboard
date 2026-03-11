import 'dart:io';
import 'dart:developer';

//
import 'package:care_desk/src/Core/App/app_flow.dart';
import 'package:care_desk/src/Core/Constants/Enums/app_source.dart';
import 'package:care_desk/src/Core/network_structure/networking/src/utils/upload_option.dart';
import 'package:care_desk/src/Shared/Entities/pagination.dart';
import 'package:care_desk/src/Shared/Models/pagination_model.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';

import '../../utils/general_utils.dart';
import '../constants/exception_constants.dart';
import '../data_source/service_interface.dart';
import '../exceptions/failure.dart';
import '../resources/data_state/data_state.dart';
import '../resources/errors/error_model.dart';

enum ResponseType {
  withData,
  withoutData,
}

abstract class RepoInterface<T> {
  /// return Your [Service] Class Instance In This Getter
  ServicesInterface get serviceInstance;

  ResponseType get responseType => ResponseType.withData;

  T Function(dynamic data) get onParse;

  bool get requireStatus => true;

  String get dataTitle {
    return 'data';
  }

  String get dataPaginationTitle {
    return 'data';
  }

  T? get devData => null;

  T? get testData => null;

  String get successMessage => "snack_success";

  String get errorMessage => "snack_error";

  // bool  checkParams({P? params}) {
  //    printDM("checkParams in useCase 1");
  //    var value;
  //    value = params?.isCorrect();
  //    printDM("checkParams in useCase 2 $value");
  //    return value;
  //  }

  Future<DataState<T>>? sendFakeData(T? data,
      {String? title, Params? params, UploadOptions? uploadOption}) async {
    log("serviceInstance => ${serviceInstance.runtimeType}");
    try {
      // AppDialogs.showLoadingDialog();
    } catch (e) {
      printDM("Error in showLoadingDialog => $e");
    }

    dynamic dataStatus;

    await Future.delayed(const Duration(seconds: 1), () {
      log("serviceInstance => ${serviceInstance.runtimeType}");
      try {
        // AppDialogs.closeOpenDialogs();
      } catch (e) {
        printDM("Error in closeOpenDialogs => $e");
      }
      printDM("Fake Data Found $T");
      dataStatus = DataSuccess<T>(data);
    });
    return dataStatus;
  }

  Future<DataState<T>>? call({Params? params,UploadOptions? uploadoption}) async {
    // switch (AppFlavors.flavor.appMode) {
    //   case AppMode.prod:
    //     return await handleCall(params: params)!;
    //   case AppMode.dev:
    //     return await handleCall(params: params)!;
    //   case AppMode.test:

    if (IntalizeAppSource.currentSource == AppSource.prod) {
      return await handleCall(params: params)!;
    }
    if (IntalizeAppSource.currentSource == AppSource.dev) {
      return await handleCall(params: params)!;
    }
    if (IntalizeAppSource.currentSource == AppSource.test) {
      return await sendFakeData(testData, params: params, title: 'Test Data',uploadOption: uploadoption)!;
    } else {
      return await handleCall(params: params)!;
    }
  }

  Future<DataState<T>>? handleCall({Params? params}) async {
    log("serviceInstance => ${serviceInstance.runtimeType}");
    bool hasPagination = false;
    {
      try {
        final httpResponse = await serviceInstance.applyService(
          params: params,
        );
        hasPagination = serviceInstance.withPagination;
        final checkStatusValue =
            requireStatus ? (httpResponse.data['status'] ?? false) : true;
        final checkResponse = ((httpResponse.statusCode == HttpStatus.ok) ||
                (httpResponse.statusCode == HttpStatus.created) ||
                (httpResponse.statusCode == HttpStatus.accepted)) &&
            checkStatusValue;
        if (checkResponse) {
          if (responseType == ResponseType.withoutData) {
            return DataSuccess<T>(onParse(httpResponse.data),
                message: httpResponse.data['message']);
          }
          if (httpResponse.data[dataTitle] != null) {
            try {
              Pagination? pagination;
              if (hasPagination) {
                try {
                  if (httpResponse.data[dataTitle]['meta'] != null) {
                    pagination = PaginationModel.fromJson(
                        httpResponse.data[dataTitle]['meta']);
                  }
                } catch (e) {
                  printDM("Pagination Error => $e");
                }
              }
              T data = onParse(hasPagination
                  ? httpResponse.data[dataTitle][dataPaginationTitle]
                  : httpResponse.data[dataTitle]);
              return DataSuccess<T>(data,
                  message: httpResponse.data['message'],
                  pagination: pagination);
            } catch (e) {
              printDM('on Catch error from Repo =>  $e');
              return DataFailed(
                ErrorModel(
                  title: httpResponse.data['message'] ?? '',
                  type: ErrorType.dirtyData,
                ),
              );
            }
          } else {
            return DataFailed(
              ErrorModel(
                title: httpResponse.data['message'] ?? '',
                type: ErrorType.dataEmpty,
              ),
            );
          }
        }
        return DataFailed(
          ErrorModel(
            title: httpResponse.data['message'] ?? '',
            type: ErrorType.serverSide,
          ),
        );
      } on BadRequestException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.badRequestException,
            type: ErrorType.serverSide,
          ),
        );
      } on ForbiddenException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.forbiddenException,
            type: ErrorType.serverSide,
          ),
        );
      } on NetworkDisconnectException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.networkDisconnectException,
            type: ErrorType.networkConnection,
          ),
        );
      } on UnAuthorizedException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.unAuthorizedException,
            type: ErrorType.serverSide,
          ),
        );
      } on NotFoundException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.notFoundException,
            type: ErrorType.serverSide,
          ),
        );
      } on MethodNotAllowedException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.methodNotAllowedException,
            type: ErrorType.serverSide,
          ),
        );
      } on NotAcceptableException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.notAcceptableException,
            type: ErrorType.serverSide,
          ),
        );
      } on RequestTimeoutException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.requestTimeoutException,
            type: ErrorType.serverSide,
          ),
        );
      } on ConflictException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.conflictException,
            type: ErrorType.serverSide,
          ),
        );
      } on InternalServerException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.internalServerException,
            type: ErrorType.serverSide,
          ),
        );
      } on NotImplementedException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.notImplementedException,
            type: ErrorType.serverSide,
          ),
        );
      } on BadGatewayException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.badGatewayException,
            type: ErrorType.serverSide,
          ),
        );
      } on ServiceUnavailableException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.serviceUnavailableException,
            type: ErrorType.serverSide,
          ),
        );
      } on GatewayTimeoutException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.gatewayTimeoutException,
            type: ErrorType.serverSide,
          ),
        );
      } on UnKnownException {
        return DataFailed(
          ErrorModel(
            title: ExceptionConstants.instance.unKnownException,
            type: ErrorType.unKnown,
          ),
        );
      }
    }
  }
}
