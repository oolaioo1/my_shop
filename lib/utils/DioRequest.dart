import 'package:dio/dio.dart';
import 'package:my_shop/contants/index.dart';
//2.封装网络请求工具
class DioRequest {
  final Dio _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(milliseconds: GlobalConstants.TIME_OUT * 1000)
      ..receiveTimeout = Duration(
        milliseconds: GlobalConstants.TIME_OUT * 1000,
      );
    _addInterceptor();
  }
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }

          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['result'];
      }
      throw Exception(data['msg'] ?? '请求失败');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

final dioRequest = DioRequest();
