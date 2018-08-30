import 'package:flutter/material.dart';

class BaseLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
