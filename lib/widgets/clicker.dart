import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;


// class ClickerWidget extends StatelessWidget {
//   // ignore: use_key_in_widget_constructors
//   ClickerWidget({

//     required AnimationController rotateClickAnimationController,
//     required Function onTap,
//     double? spreadRadius,
//     double? blurRadius,
//     double? borderRadius

//   }) : 

//   _rotateClickAnimationController = rotateClickAnimationController,
//   _onTap = onTap,
//   _spreadRadius = spreadRadius ?? 10,
//   _blurRadius = blurRadius ?? 70,
//   _borderRadius = borderRadius ?? 500,
//   super();

//   final AnimationController _rotateClickAnimationController;
//   final Function _onTap;
//   final double _spreadRadius;
//   final double _blurRadius;
//   final double _borderRadius; 

  



//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _rotateClickAnimationController,
//         builder: (_, child) {
//           return Transform.rotate(
//             child: child,
//             angle: 2 * _rotateClickAnimationController.value * math.pi,
//           );
//         },
//         child: GestureDetector(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(_borderRadius),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.8),
//                   spreadRadius: _spreadRadius,
//                   blurRadius: _blurRadius,
//                   offset:
//                       Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//               image: const DecorationImage(
//                 image:
//                     AssetImage('assets/images/neon-clicker.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             height: MediaQuery.of(context).size.width * 0.5,
//             width: MediaQuery.of(context).size.width * 0.5,
//           ),
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             _onTap();

//           }, 
//         ));
//   }
// }


class Clicker extends StatefulWidget {

  
   Clicker({ 
    
    required AnimationController rotateClickAnimationController,
    required Function onTap,
    double? spreadRadius,
    double? blurRadius,
    double? borderRadius
    
    }) : 
  _rotateClickAnimationController = rotateClickAnimationController,
  _onTap = onTap,
  _spreadRadius = spreadRadius ?? 10,
  _blurRadius = blurRadius ?? 70,
  _borderRadius = borderRadius ?? 500,
  
  super();


  final AnimationController _rotateClickAnimationController;
  final Function _onTap;
  final double _spreadRadius;
  final double _blurRadius;
  final double _borderRadius; 

 


  @override
  _ClickerState createState() => _ClickerState();
}

class _ClickerState extends State<Clicker> {

  int clickPerSecond = 0;
  double baseRotate = 0;
  int clickPerSecCompt = 0;

  @override
  void initState() {
    super.initState();
 
     Timer timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => UpdateClickPerSecond());

     Timer increaseRot = Timer.periodic(const Duration(milliseconds: 1), (Timer t) => UpdateRotation());
  }


  void UpdateClickPerSecond(){


    clickPerSecond = clickPerSecCompt;
    clickPerSecCompt = 0;

  }


  void UpdateRotation(){
    baseRotate += 0.01 + (clickPerSecond/2*0.01);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget._rotateClickAnimationController,
        builder: (_, child) {
          return Transform.rotate(
            child: child,
            
            angle:   widget._rotateClickAnimationController.velocity * (math.pi * baseRotate),
          );
        },
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget._borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: widget._spreadRadius,
                  blurRadius: widget._blurRadius,
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
            widget._onTap();
            clickPerSecCompt++;
          }, 
        ));
  }
}