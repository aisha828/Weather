import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRepository {
  final String? url;
  final Map<String, dynamic>? payload;

  ApiRepository({this.url, this.payload});

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      // Execute the beforeSend function if provided
      if (beforeSend != null) {
        beforeSend();
      }

      // Create the query parameters string
      final uri = Uri.parse(url!).replace(queryParameters: payload);

      // Send the GET request
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Parse the response body
        final data = json.decode(response.body);

        if (onSuccess != null) {
          onSuccess(data);
        }
      } else {
        // Handle non-200 status codes
        if (onError != null) {
          onError('Error: ${response.statusCode}');
        }
      }
    } catch (error) {
      // Handle errors
      if (onError != null) {
        onError(error);
      }
    }
  }
}
