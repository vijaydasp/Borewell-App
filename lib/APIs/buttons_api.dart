// ignore_for_file: avoid_print
import 'package:borwell_app/ipaddress_page.dart';
import 'package:dio/dio.dart';

final dio = Dio();


Future<void> connectingapi(String datas) async {
  try {
    final response = await dio.post('${baseUrl_sys}/control',data: datas);
    print("Response: ${response.data}");
  } catch (e) {
    print('Error connecting to API: $e');
  }
}