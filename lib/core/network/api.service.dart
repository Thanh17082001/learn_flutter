import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class ApiService {
  final Dio _dio;

    // Danh sách endpoint không cần token
  final List<String> _noAuthEndpoints = [
    '/auth/login',
    '/register',
    // Thêm các route public khác nếu có
  ];

  ApiService._internal(this._dio);

  static final ApiService _instance = ApiService._internal(
    Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ),
  ).._addInterceptors();

  factory ApiService() => _instance;

  // token reqest
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!_noAuthEndpoints.contains(options.path)){
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString(Constants.tokenKey);
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          }
      
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  // API methods
  Future<Response> post(String endpoint, {dynamic data}) async {
   
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      return 'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
    } else {
      return 'Connection error: ${error.message}';
    }
  }
}
