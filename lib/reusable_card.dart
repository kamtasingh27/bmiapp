import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {

  reusableCard({@required this.clr, this.cardChild});

  final Color clr;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}