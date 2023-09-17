import 'package:flutter/material.dart';

import '../errors/failures/base_failure.dart';

class FailureWidget extends StatelessWidget {
  final BaseFailure failure;
  final Function? refreshCallback;
  const FailureWidget({
    required this.failure,
    this.refreshCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            failure.message,
          ),
          GestureDetector(
            child: const Icon(Icons.refresh),
            onTap: () {
              refreshCallback?.call();
            },
          )
        ],
      ),
    );
  }
}
