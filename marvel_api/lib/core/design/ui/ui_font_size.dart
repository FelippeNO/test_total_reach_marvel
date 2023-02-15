import 'ui_scale.dart';

class UIFontSize {
  static double _relativeFontSize(double value) => 0.00107556 * value * UIScale.diagonalDevice;

  static final double fs32 = _relativeFontSize(32);
  static final double fs28 = _relativeFontSize(28);
  static final double fs24 = _relativeFontSize(24);
  static final double fs20 = _relativeFontSize(20);
  static final double fs18 = _relativeFontSize(18);
  static final double fs16 = _relativeFontSize(16);
  static final double fs14 = _relativeFontSize(14);
  static final double fs12 = _relativeFontSize(12);
}
