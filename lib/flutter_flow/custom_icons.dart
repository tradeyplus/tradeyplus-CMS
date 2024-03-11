import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _chartsFamily = 'Charts';
  static const String _navFamily = 'Nav';

  // Charts
  static const IconData kline = IconData(0xe900, fontFamily: _chartsFamily);
  static const IconData kbar = IconData(0xe901, fontFamily: _chartsFamily);

  // Nav
  static const IconData kfile = IconData(0xe901, fontFamily: _navFamily);
  static const IconData khome = IconData(0xe902, fontFamily: _navFamily);
  static const IconData ksignal = IconData(0xe903, fontFamily: _navFamily);
}
