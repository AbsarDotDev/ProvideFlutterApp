import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  void login(String email, String pwd) async {
    setLoading(true);
    try {
      var url = Uri.parse('https://reqres.in/api/login');
      var response =
          await http.post(url, body: {'email': email, 'password': pwd});
      if (response.statusCode == 200) {
        setLoading(false);
        print("Successful");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
