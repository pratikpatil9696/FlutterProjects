import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginAPI {
  static void loginAPIModel(String email) async {
    final url =
        Uri.parse("https://demo0413095.mockable.io/digitalflake/api/login");
    Map requestBody = {
      'user_id': email,
      'message': "Signed in successfull",
    };
    var response = await http.post(url,
        headers: {
          "content-type": "application/json",
          "Accept": "application/json"
        },
        body: json.encode(requestBody));

    if (response.statusCode == 200) {
      print("Response Body: ${response.body}");
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
