import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://restapi.adequateshop.com/api/authaccount',
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ));

  // تسجيل مستخدم جديد
  Future<Map<String, dynamic>> signUp(String name, String email, String password) async {
    try {
      Response response = await _dio.post(
        '/registration',
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      return response.data;
    } catch (e) {
      return {'message': 'Error: $e'};
    }
  }

  // تسجيل الدخول
  Future<Map<String, dynamic>> logIn(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      return response.data;
    } catch (e) {
      return {'message': 'Error: $e'};
    }
  }
}
