import 'dart:convert';

import 'package:learn_flutter/core/network/api.service.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> login(String username, String password) async {
    final response = await apiService.post('auth/login', data: {
      'email': username,
      'password': password,
    });

    final data = response.data['data'];

    return data['accessToken'] ?? 'thiên thanh';
  }
}
