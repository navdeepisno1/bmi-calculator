import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final String genderText;
  final IconData genderIcon;

  GenderWidget({this.genderText, this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderText,
          style: TextStyle(fontSize: 18, color: Color(0xFF808e98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function cardOnClick;

  ReusableCard({this.cardColor, this.cardChild, this.cardOnClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardOnClick,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon,@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f4e),
      constraints: BoxConstraints.tightFor(width: 52,height: 52),
    );
  }
}
