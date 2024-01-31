import 'package:flutter/material.dart';
import 'test_page_2.dart';

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page 1'),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TestPage2();
              },
            ),
          );
        },
        child: const Text('進む'),
      )),
    );
  }
}
