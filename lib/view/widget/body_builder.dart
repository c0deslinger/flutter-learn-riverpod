import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/viewmodels/home_viewmodel.dart';

import 'error_widget.dart';

class BodyBuilder extends StatelessWidget {
  final APIRequestStatus? apiRequestStatus;
  final Widget? child;
  final Widget? loadingWidget;
  final Function? reload;

  BodyBuilder(
      {Key? key,
      @required this.apiRequestStatus,
      @required this.child,
      @required this.loadingWidget,
      @required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loading:
        return loadingWidget!;
      case APIRequestStatus.unInitialized:
        return loadingWidget!;
      case APIRequestStatus.connectionError:
        return MyErrorWidget(refreshCallBack: reload!, isConnection: true);
      case APIRequestStatus.error:
        return MyErrorWidget(refreshCallBack: reload!);
      case APIRequestStatus.loaded:
        return child!;
      default:
        return loadingWidget!;
    }
  }
}
