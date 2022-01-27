import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/controller/states.dart';
import 'package:flutter_learn_riverpod/widget/error_retry.dart';

class BodyBuilder extends StatelessWidget {
  final StatusState requestStatus;
  final Widget child;
  final Widget loadingWidget;
  final Function onReload;

  const BodyBuilder(
      {Key? key,
      required this.requestStatus,
      required this.child,
      required this.loadingWidget,
      required this.onReload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (requestStatus) {
      case StatusState.initial:
        return Container();
      case StatusState.loading:
        return loadingWidget;
      case StatusState.failed:
        return ErrorRetry(
            onPressed: () {
              onReload();
            },
            text: "Retry");
      case StatusState.loaded:
        return child;
    }
  }
}
