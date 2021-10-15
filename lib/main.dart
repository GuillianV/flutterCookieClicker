import 'package:flutter/material.dart';
import './views/shop.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neon clicker',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Neon clicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late final AnimationController _rotateClickAnimationController;

  @override
  void initState() {
    super.initState();
    _rotateClickAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )..repeat();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-neon.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  AnimatedBuilder(
                      animation: _rotateClickAnimationController,
                      builder: (_, child) {
                        return Transform.rotate(
                          child: child,
                          angle: 2 * _rotateClickAnimationController.value * math.pi,
                        );
                      },
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.8),
                                spreadRadius: 10,
                                blurRadius: 70,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/neon-clicker.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          _incrementCounter();
                        },
                      )),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
