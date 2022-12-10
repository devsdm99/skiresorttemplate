import 'package:skiresorttemplate/providers/providers.dart';

class LoginProvider extends BaseProvider {
  //private fields
  String? _email;

  //getters
  String get email => _email ?? "";

  //setters
  set email(String value) {
    _email = value;
    notifyListeners();
  }
}
