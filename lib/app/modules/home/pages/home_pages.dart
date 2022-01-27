import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn_riverpod/app/modules/home/notifier/home.notifier.dart';
import 'package:flutter_learn_riverpod/providers.dart';
import 'package:flutter_learn_riverpod/widget/body_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeNotifier = useProvider(homeProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("List Data")),
        body: Center(
          child: BodyBuilder(
            requestStatus: homeNotifier.requestStatus,
            loadingWidget: const CircularProgressIndicator(),
            child: _createListView(homeNotifier),
            reload: () => homeNotifier.getData(),
          ),
        ));
  }

  _createListView(HomeNotifier homeNotifier) {
    return RefreshIndicator(
      onRefresh: () async {
        homeNotifier.getData();
      },
      child: ListView.builder(
        itemCount: homeNotifier.homeResponse?.posts?.data?.length ?? 0,
        itemBuilder: (context, index) {
          var datum = homeNotifier.homeResponse?.posts?.data![index];
          return Card(child: Text(datum?.title ?? "N/A"));
        },
      ),
    );
  }
}
