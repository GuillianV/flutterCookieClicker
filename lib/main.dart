import 'package:coockie_clicker/widgets/buy_button.dart';
import 'package:flutter/material.dart';
import './widgets/clicker.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Neon clicker'),
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

  double widthScreen = 0;
  double heightScreen = 0;
  late final AnimationController _rotateClickAnimationController;

  @override
  void initState() {
    super.initState();
    _rotateClickAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-neon.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Clicker(
                rotateClickAnimationController: _rotateClickAnimationController,
                onTap: () {
                  _incrementCounter();
                },
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  BuyButton(onTap: () {_incrementCounter();}, innerText: "Click x2", imageUrl: 'assets/images/icon-stonks.png' , sizeMultiplier: 1.4, price: 20, recompense: "Clicker auto"),
                   BuyButton(onTap: () {_incrementCounter();}, innerText: "Auto Clicker", imageUrl: 'assets/images/icon-mouse.png' , sizeMultiplier: 1.4,price: 40, recompense: "Clicker double"),
                ],
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
