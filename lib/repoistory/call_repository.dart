import 'package:dio/dio.dart';

class CallRepository {
  final Dio dio;

  CallRepository({required this.dio});

  Future<List<String>> getCalls() async {
    // Implement your API call here
    final response = await dio.get('https://jsonplaceholder.typicode.com');
    return (response.data as List).map((call) => call.toString()).toList();
  }
}
