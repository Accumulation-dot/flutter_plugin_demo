import 'package:dio/dio.dart';

/// method 枚举
enum NetMethod {
  /// GET
  NMGet,

  /// POST
  NMPost
}

/// get
const String MGet = "get";

/// post
const String MPost = "post";

String _method(NetMethod method) {
  switch (method) {
    case NetMethod.NMPost:
      return MPost;
    default:
      return MGet;
  }
}

/// 网络请求
class NetUtil {
  /// base_url
  static const String base_url = "https://api.apiopen.top/";

  /// 连接超时
  static const int connectTimeout = 5000;

  /// 接受超时
  static const int receiveTimeout = 3000;

  /// 发送超时
  static const int sendTimeout = 3000;

  /// 单例对象声明
  static final NetUtil _instance = NetUtil._shared();

  factory NetUtil() {
    return _instance;
  }

  NetUtil._shared();

  /// 属性声明
  BaseOptions _baseOptions = BaseOptions(baseUrl: NetUtil.base_url);

  /// private method
  BaseOptions _baseOptionsMerge(
      Map<String, dynamic> queryParameters, NetMethod method) {
    return _baseOptions.merge(
        queryParameters: queryParameters, method: _method(method));
  }

  /// 网络请求
  /// uri: 路径
  /// method: 网络请求方式 默认为get
  /// queryParameters: 请求参数 默认为空
  Future<Response> requestUri(String uri,
      {NetMethod method, Map<String, dynamic> queryParameters}) async {
    BaseOptions baseOptions = _baseOptionsMerge(queryParameters, method);
    Dio dio = Dio(baseOptions);
    try {
      return await dio.request(uri);
    } catch (e) {
      return e;
    }
  }

  Future<Response> requestUrl(String url, String uri,
      {NetMethod method, Map<String, dynamic> queryParameters}) async {
    BaseOptions baseOptions = _baseOptions.merge(
        baseUrl: url,
        queryParameters: queryParameters,
        method: _method(method));
    Dio dio = Dio(baseOptions);
    try {
      return await dio.request(uri);
    } catch (e) {
      return e;
    }
  }
}
