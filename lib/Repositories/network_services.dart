import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NetworkService {
  NetworkService();

  // Generic GET method
  Future<T> get<T>(String endpoint, T Function(Map<String, dynamic>) fromJson,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      final data = _processResponse(response);
      return fromJson(data);
    } catch (e) {
      log(e.toString());
      throw Exception('GET request failed: $e');
    }
  }

  // Generic POST method
  Future<T> post<T>(String endpoint, T Function(Map<String, dynamic>) fromJson,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      final data = _processResponse(response);
      return fromJson(data);
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  // Private method to process response
  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      // genericDialog(context: context, contentText: contentText)

      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }
}
