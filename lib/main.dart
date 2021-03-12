import 'package:flutter/material.dart';

import 'ListsShow.dart';

void main() {
  runApp(new ListLongViewVC(items: new List<String>.generate(10000, (index) => "Item $index")));
}
