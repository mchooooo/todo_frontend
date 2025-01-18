import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/call.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080/api/call', // Spring Boot API 주소
      connectTimeout: Duration(), // 연결 타임아웃
      receiveTimeout: Duration(), // 응답 타임아웃
      headers: {'Content-Type': 'application/json'}, // 기본 헤더
    ),
  );

// GET 요청: 단일 Call 가져오기
Future<Call> fetchCall(int id) async {
  print("test");
  print(id);
  Map<String, int> map = {
    "id": id
  };
  try {
    // ID를 사용하여 API 호출
    final response = await _dio.get(
      '',
      queryParameters: {'id':id}
    );

    print(response);

    if (response.statusCode == 200) {
      // JSON 데이터를 Call 객체로 변환
      return Call.fromJson(response.data);
    } else {
      throw Exception('Failed to load call with ID: \$id');
    }
  } on DioException catch (e) {
    print('Dio Error: \${e.message}');
    throw Exception('Failed to load call with ID: \$id');
  }
}


  // POST 요청: Call 생성
  Future<Call> createCall(Call call) async {
    try {
      final response = await _dio.post(
        '',
        data: json.encode(call.toJson()),
      );
      if (response.statusCode == 201) {
        return Call.fromJson(response.data);
      } else {
        throw Exception('Failed to create call');
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      throw Exception('Failed to create call');
    }
  }
}
