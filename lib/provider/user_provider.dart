import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String userName;
  String getUserName() {
    return userName;
  }

  void setName() {
    userName = "sabin Tamang";
    notifyListeners();
  }
}
