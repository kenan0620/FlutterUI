import 'package:flutter/material.dart';

import 'ListsShow.dart';

void main() {
  runApp(new ListWorkVC(
    items: new List<ListItem>.generate(
      1000,
          (i) => i % 6 == 0
          ? new HeadingItem("Heading $i")
          : new MessageItem("Sender $i", "Message body $i"),
    ),
  ));
}
