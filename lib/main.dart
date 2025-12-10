import "package:flutter/material.dart";
import "package:gmail/page/page_gmail.dart";

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Gmail App", home: PageGmail());
  }
}
