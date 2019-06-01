import 'dart:async';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/foundation.dart';

class ConnectivityService extends ChangeNotifier {
  ConnectivityService() {
    CheckConection();
  }

  bool _isconnected = true;

  bool get ConnectionResult => _isconnected;

  CheckConection() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result.toString() == "ConnectivityResult.wifi") {
        _isconnected = true;
        notifyListeners();
      } else if (result.toString() == "ConnectivityResult.mobile") {
        _isconnected = true;
        notifyListeners();
      } else {
        _isconnected = false;
        notifyListeners();
      }
    });
  }
}
