
import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({
    Key? key,
    required Function onTap,
    required String innerText,
    required String imageUrl,
    required int price,
    String? recompense,
    double? sizeMultiplier
  }) : _onTap = onTap, _innerText = innerText, _imageUrl = imageUrl, _sizeMultiplier = sizeMultiplier ?? 1, _price = price, _recompense = recompense ?? "",  super(key: key);

  final Function _onTap;
  final String _innerText;
  final String _imageUrl;
  final double _sizeMultiplier;
  final int _price;
  final String _recompense;
  
  @override
  Widget build(BuildContext context) {

 double widthScreen  = MediaQuery.of(context).size.width * _sizeMultiplier;
  double heightScreen = MediaQuery.of(context).size.height * _sizeMultiplier;
  

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          
          child: Center(
            child: Column(children: [
              Text(_innerText),
              Image.asset(_imageUrl,height: widthScreen*0.05),
              Text('Coute $_price'),
              Text(_recompense)

            ],
            mainAxisAlignment: MainAxisAlignment.center,
            ),

          ),
          onPressed:  (){_onTap();},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500)
                ),
              
            ),
            //Couleur base
            backgroundColor:  MaterialStateProperty.all(const Color.fromRGBO(12,32,123,0.6)),
            fixedSize: MaterialStateProperty.all( Size(  (widthScreen) * 0.2, (widthScreen) * 0.2))
            
          ),
        ),
      ),
    );
  }
}
