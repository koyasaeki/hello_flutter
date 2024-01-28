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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationDouble;
  late Animation<Color?> _animationColor;
  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  final ColorTween _tweenColor = ColorTween(begin: Colors.green, end: Colors.blue);

  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // Tween と AnimationController から Animation (サイズ) を作成する。
    _animationDouble = _tweenDouble.animate(_animationController);
    // 変更を反映させるためにやっているだけ。
    _animationDouble.addListener(() {
      setState(() {});
    });

    // Tween と AnimationController から Animation (色) を作成する。
    _animationColor = _tweenColor.animate(_animationController);
    // 変更を反映させるためにやっているだけ。
    _animationColor.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('AnimationController: ${_animationController.value}'),
            Text('AnimationDouble: ${_animationDouble.value}'),
            Text('AnimationColor: ${_animationColor.value}'),
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: SizedBox(
                  width: _animationDouble.value,
                  height: _animationDouble.value,
                  child: Container(
                    color: _animationColor.value,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _forward,
            child: const Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: _stop,
            child: const Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: _reverse,
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
