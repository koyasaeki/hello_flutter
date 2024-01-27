import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _flag = false;

  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Row(
            children: [
              Icon(Icons.create),
              Text('初めてのタイトル'),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _flag ? 0.1 : 1.0,
              duration: const Duration(seconds: 3),
              child: Text(
                '消える文字',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            // 一部のエミュレータでは縮小が動作しない
            AnimatedSize(
              duration: const Duration(seconds: 1),
              child: SizedBox(
                width: _flag ? 50 : 100,
                height: _flag ? 50 : 200,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
            AnimatedAlign(
              alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
              duration: const Duration(seconds: 5),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Container(
                  color: Colors.amber,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.add),
      ),
    );
  }
}
