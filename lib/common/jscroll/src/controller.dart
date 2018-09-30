import './status.dart';
import 'package:flutter/material.dart';

class RefreshController {
  ValueNotifier<int> _headerMode;
  ValueNotifier<int> _footerMode;
  ScrollController scrollController;

  void requestRefresh(bool up) {
    if (up) {
      if (_headerMode.value == RefreshStatus.idle)
        _headerMode.value = RefreshStatus.refreshing;
    } else {
      if (_footerMode.value == RefreshStatus.idle) {
        _footerMode.value = RefreshStatus.refreshing;
      }
    }
  }

  void scrollTo(double offset) {
    scrollController.jumpTo(offset);
  }

  void sendBack(bool up, int mode) {
    if (up) {
      _headerMode.value = mode;
    } else {
      _footerMode.value = mode;
    }
  }

  int get headerMode => _headerMode.value;

  int get footerMode => _footerMode.value;

  isRefresh(bool up) {
    if (up) {
      return _headerMode.value == RefreshStatus.refreshing;
    } else {
      return _footerMode.value == RefreshStatus.refreshing;
    }
  }
}
