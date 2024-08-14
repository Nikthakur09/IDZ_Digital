
import 'package:assignment/model/employee.dart';
import 'package:assignment/services/url.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final String url = URL;
  Dio dio = Dio();

  Future<List<Employee>> getData() async {
    try {
      Response response = await dio.get(url);
      print(response.data);
      var result = response.data['employees'] as List;
      List<Employee> employees = Employee.fromJSONArray(result);
      return employees;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
