import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/model/photo_response.dart';
import 'package:flutter_learn_riverpod/state/state_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<List<GetPhotosResponse>> photos = watch(photoStateFuture);
    return Scaffold(
        appBar: AppBar(title: const Text("Riverpod Example")),
        body: photos.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
                  child: Text(err.toString()),
                ),
            data: (photos) {
              return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(photos[index].thumbnailUrl ?? "-"),
                          ),
                          title: Text(photos[index].title ?? "-"),
                        )
                      ],
                    );
                  });
            }));
  }
}
