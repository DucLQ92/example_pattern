import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../build_constants.dart';
import '../model/response/api_base_response.dart';

class ApiClient {
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String PATCH = 'PATCH';
  static const String PUT = 'PUT';

  static const CONTENT_TYPE = 'Content-Type';
  static const CONTENT_TYPE_JSON = 'application/json';

  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  static final BaseOptions defaultOptions = BaseOptions(
    connectTimeout: const Duration(milliseconds: connectTimeout),
    receiveTimeout: const Duration(milliseconds: receiveTimeout),
    responseType: ResponseType.json,
    baseUrl: BuildConstants.serverAPI,
  );

  late Dio _dio;

  static final Map<BaseOptions, ApiClient> _instanceMap = {};

  factory ApiClient({BaseOptions? options}) {
    options ??= defaultOptions;
    if (_instanceMap.containsKey(options)) {
      return _instanceMap[options]!;
    }
    final ApiClient apiClient = ApiClient._create(options: options);
    _instanceMap[options] = apiClient;
    return apiClient;
  }

  ApiClient._create({BaseOptions? options}) {
    options ??= defaultOptions;
    _dio = Dio(options);
    if (BuildConstants.currentEnvironment != Environment.prod) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          typeColor: Platform.isIOS ? PrettyDioLoggerColor.none : PrettyDioLoggerColor.green,
        ),
      );
    }
  }

  static ApiClient get instance => ApiClient();

  Future<ApiBaseResponse> request({
    String? url,
    String method = POST,
    String? data,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    bool getFullResponse = false,
    CancelToken? cancelToken,
  }) async {
    if ((url ?? '').isEmpty) {
      log('!!!!!!EMPTY URL!!!!!! - data: $data');
      return ApiBaseResponse(
        success: false,
        data: null,
        message: 'EndPoint trống'.tr,
        resultCode: 2107,
      );
    }

    Map<String, dynamic> headerMap = {};
    headerMap.putIfAbsent("accept", () => "*/*");
    Response response;
    try {
      response = await _dio.request(
        url!,
        cancelToken: cancelToken,
        data: formData != null ? FormData.fromMap(formData) : data ?? jsonEncode({}),
        options: Options(
          method: method,
          sendTimeout: const Duration(milliseconds: connectTimeout),
          receiveTimeout: const Duration(milliseconds: receiveTimeout),
          headers: headerMap,
          contentType: formData != null ? 'multipart/form-data' : CONTENT_TYPE_JSON,
        ),
        queryParameters: queryParameters,
      );
      if (_isSuccessful(response.statusCode!)) {
        return ApiBaseResponse(
          success: true,
          data: response.data,
          message: '',
          resultCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      String errorMessage = 'Đã có lỗi xảy ra'.tr;
      int errorCode = -9999;
      if (e.response != null) {
        errorCode = e.response!.statusCode ?? -8888;
        errorMessage = e.response!.statusMessage ?? 'Đã có lỗi xảy ra'.tr;
      } else if (e.error is SocketException) {
        SocketException? socketException = e.error as SocketException?;
        errorCode = socketException?.osError?.errorCode ?? -7777;
        errorMessage = 'noConnectionError'.tr;
      } else {
        errorCode = e.type.index;
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            errorMessage =
                '${'Có vẻ như máy chủ mất quá nhiều thời gian để phản hồi, vui lòng thử lại sau'.tr} (${e.type.toString().replaceFirst('DioExceptionType.', '')})';
            break;
          case DioExceptionType.badCertificate:
          case DioExceptionType.badResponse:
          case DioExceptionType.cancel:
          case DioExceptionType.connectionError:
          case DioExceptionType.unknown:
            errorMessage =
                '${'Có lỗi trong quá trình kết nối đến máy chủ, vui lòng thử lại sau'.tr} (${e.type.toString().replaceFirst('DioExceptionType.', '')})';
            break;
          default:
            errorCode = -9999;
            errorMessage = e.error != null ? e.error.toString() : (e.message ?? 'Đã có lỗi xảy ra'.tr);
            break;
        }
      }
      return ApiBaseResponse(
        success: false,
        data: null,
        message: '$errorMessage${BuildConstants.currentEnvironment == Environment.prod ? '' : '\nEndPoint $url'}',
        resultCode: errorCode,
      );
    }
    throw ('Request not successful');
  }

  bool _isSuccessful(int i) {
    return i >= 200 && i <= 299;
  }
}
