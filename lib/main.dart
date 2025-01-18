import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(
    const MaterialApp(
      home: MyWidget(),
    ),
  );
}
 
// API 요청 결과를 반영할 상태 변경 위젯
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
 
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
 
class _MyWidgetState extends State<MyWidget> {
  // dio 패키지를 통해 API 통신 결과를 저장할 변수
  dynamic dioResultJson = '';
  String dioResultValue = '';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
              // dio 패키지를 통해 API 통신 수행 버튼
              ElevatedButton(
                onPressed: () async {
                  print("press");
                  // API 요청
                  final response = await Dio().get('http://localhost:8080/api/call',
                  queryParameters: {'id' : 1});

                  print(response.realUri);
              

                  // API 응답 결과 반영을 위한 상태 변경
                  setState(() {
                    // 전체 값 호출
                    dioResultJson = response.data;

 
                    // 특정 키 값 호출 : 'result' 키의 값 호출
                    dioResultValue = response.data['description'];
                  });
                },
                child: const Text('dio'),
              ),
              const Divider(),
              Text('응답 결과 : Json 타입\n$dioResultJson'),
              const Divider(),
              Text('특정 키의 값 호출\n$dioResultValue'),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}