import 'package:flutter/material.dart';

import '../colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final String toast;
  const ButtonWidget({required this.title,required this.toast, super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
      onPressed: () {
        print('Pressed');
         final snackBar = SnackBar(
            content: Text(toast),
            backgroundColor: kPrimary1Color,
            action: SnackBarAction(
              label: 'Undo',
              textColor: kSecondary2Color,
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
       /*  SnackBar(content: Text(toast, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: 
     FontWeight.bold),), duration: Duration(seconds: 2), backgroundColor: Colors.red,); */
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return kPrimary1Color;
            return kPrimaryColor;
          },
        ),
      ),
    );
  }
}
