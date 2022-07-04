import 'dart:convert';

import 'package:http/http.dart' as http;

// Functionality for Sending Notification
class Notification {
  static sendNotification(String userId) async {
    try {
      var url = Uri.parse(
          'https://app-dev-task.herokuapp.com/users/sendNotification');

      var headers = {"Content-type": "application/json"};

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'user_id': userId,
        }),
      );
    } catch (e) {
      rethrow;
    }
  }
}
