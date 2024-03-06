import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  String endpoint = "http://192.168.1.9:3000/api/v1";

  //--------------------------Get Requests----------------------//

  // Future<List<CategoriesModel>> fetchCategories() async {
  //   final response =
  //       await http.get(Uri.parse('$endpoint/categories/getAllCategories'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonCategories =
  //         json.decode(response.body)['categories'];
  //     return jsonCategories
  //         .map((json) => CategoriesModel.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load categories');
  //   }
  // }

//--------------------------------------------------POST Requests-------------------------------------------------//

  Future<bool> loginRequest(email, password) async {
    // Request parameters
    Map<String, String> requestBody = {
      'usernameOrEmail': '$email',
      'password': '$password',
    };
    // Make the POST request
    try {
      final response = await http.post(
        Uri.parse("$endpoint/auth/login"),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // Check the response status
      if (response.statusCode == 200) {
        print('api true');
        return true;
      } else {
        print('api false');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  registerRequest(username, phoneNumber, email, password) async {
    // Request parameters
    Map<String, String> requestBody = {
      'email': '$email',
      'password': '$password',
      'username': '$username',
      'phoneNumber': '$phoneNumber',
    };
    // Make the POST request
    try {
      final response = await http.post(
        Uri.parse("$endpoint/auth/register"),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // Check the response status
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

  Future<bool> otpRequest(email, otp) async {
    // Request parameters
    Map<String, String> requestBody = {
      'email': '$email',
      'otp': '$otp',
    };
    // Make the POST request
    try {
      final response = await http.post(
        Uri.parse("$endpoint/auth/verify-email"),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // Check the response status
      if (response.statusCode == 200) {
        print('register api true');
        return true;
      } else {
        print('register api false');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
