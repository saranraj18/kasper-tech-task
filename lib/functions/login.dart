import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

// Functionality for Login, Sign up and Generating Notification Token
class Login {
  static Future loginUser(String email, String password) async {
    try {
      var url = Uri.parse('https://app-dev-task.herokuapp.com/users/login');

      var headers = {"Content-type": "application/json"};

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        final decodedResp = jsonDecode(response.body);

        return decodedResp["msg"];
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> signUpUser(Object body) async {
    try {
      var url = Uri.parse('https://app-dev-task.herokuapp.com/users/register');

      var headers = {"Content-type": "application/json"};

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      print(response.body);

      if (response.statusCode == 200) {
        final respBody = json.decode(response.body);
        print(respBody);
        generateToken(respBody['token'], respBody['user']['_id']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future generateToken(String authToken, String userId) async {
    await Firebase.initializeApp();
    FirebaseMessaging _fcm = FirebaseMessaging.instance;

    final token = await _fcm.getToken();

    var url =
        Uri.parse("https://app-dev-task.herokuapp.com/users/notificationToken");

    var headers = {
      "Content-type": "application/json",
      "x-auth-token": authToken,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode({"token": token, "user_id": userId}),
    );

    if (response.statusCode != 200) {
      print("Error");
    }
  }
}
