import 'package:flutter/material.dart';

class LandingCard extends StatefulWidget {
  LandingCard({
    super.key,
    required this.title,
    required this.width,
    required this.child,
  });

  String title;
  Widget child;
  double width;

  @override
  State<LandingCard> createState() => _LandingCardState();
}

class _LandingCardState extends State<LandingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      width: widget.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0.1,
            blurRadius: 1.5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: widget.width,
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
