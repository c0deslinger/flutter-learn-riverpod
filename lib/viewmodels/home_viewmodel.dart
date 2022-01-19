import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/data/service/network_service.dart';
import 'package:flutter_learn_riverpod/utils/util.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getCharacters();
  }

  NetworkService service = NetworkService();
  List characters = [];
  APIRequestStatus requestStatus = APIRequestStatus.loading;

  getCharacters() async {
    requestStatus = APIRequestStatus.loading;
    notifyListeners();
    try {
      Map body = await service.getCharacters();
      characters = body['results'];
      requestStatus = APIRequestStatus.loaded;
      notifyListeners();
    } catch (e) {
      if (Util.isConnectionError(e)) {
        requestStatus = APIRequestStatus.connectionError;
        notifyListeners();
      } else {
        requestStatus = APIRequestStatus.error;
        notifyListeners();
      }
    }
  }
}

enum APIRequestStatus {
  unInitialized,
  loading,
  loaded,
  error,
  connectionError,
}
