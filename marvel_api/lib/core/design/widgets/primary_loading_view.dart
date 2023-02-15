import 'package:flutter/material.dart';

import '../ui/ui_colors.dart';

class PrimaryLoadingView extends StatelessWidget {
  const PrimaryLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        valueColor: AlwaysStoppedAnimation<Color>(UIColors.red),
      ),
    );
  }
}
