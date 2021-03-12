import 'package:flutter/material.dart';

import 'Taps.dart';

void main() {
  runApp(new ScrollCloseVC(items: new List<String>.generate(100, (index) => "Item ${index + 1}"),));
}
