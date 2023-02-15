import 'package:flutter/material.dart';

import '../ui/ui_colors.dart';
import '../ui/ui_scale.dart';
import '../ui/ui_text.dart';

class PrimaryFailureView extends StatelessWidget {
  const PrimaryFailureView({
    super.key,
    this.message,
    this.onRetry,
  });

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIPadding.px32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UIText(
              'Oops... Algo deu errado!',
              containerAlignment: Alignment.center,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: UIPadding.px32),
            Container(
              alignment: Alignment.center,
              height: UIScale.height(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: UIColors.lightRed.withOpacity(0.2),
              ),
              child: UIText(
                ':(',
                style: TextStyle(
                  color: UIColors.red,
                  fontSize: UIScale.width(14),
                  fontWeight: FontWeight.w700,
                ),
                containerAlignment: Alignment.center,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: UIPadding.px16),
            message != null
                ? UIText(
                    message!,
                    containerAlignment: Alignment.center,
                    textAlign: TextAlign.center,
                  )
                : const SizedBox.shrink(),
            SizedBox(height: UIPadding.px32),
            onRetry != null
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: UIColors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                      child: const Text(
                        'Tentar Novamente',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => onRetry!(),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
