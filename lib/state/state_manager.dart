import 'package:flutter_learn_riverpod/model/photo_response.dart';
import 'package:flutter_learn_riverpod/network/network_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoStateFuture = FutureProvider<List<GetPhotosResponse>>((ref) async {
  return fetchPhotos();
});
