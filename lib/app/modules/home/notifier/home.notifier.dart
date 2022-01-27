import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/app/modules/home/models/home.dart';
import 'package:flutter_learn_riverpod/app/modules/home/repository/home_repository.dart';
import 'package:flutter_learn_riverpod/controller/states.dart';

class HomeNotifier extends ChangeNotifier {
  StatusState requestStatus = StatusState.initial;
  String? errorMessage;
  late IHomeRepository homeRepository;
  HomeResponse? homeResponse;

  HomeNotifier(IHomeRepository _homeRepository) {
    homeRepository = _homeRepository;
    getData();
  }

  getData() async {
    requestStatus = StatusState.loading;
    notifyListeners();
    final either = await homeRepository.getHome();
    homeResponse = either.fold((l) {
      errorMessage = l.message;
      requestStatus = StatusState.failed;
      return null;
    }, (r) {
      requestStatus = StatusState.loaded;
      return r;
    });
    notifyListeners();
  }
}
