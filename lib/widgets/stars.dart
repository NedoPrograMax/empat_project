import 'package:flutter/material.dart';

class Stars extends StatefulWidget {
  final int rating;
  final void Function(int) changeRating;
  const Stars(
    this.rating,
    this.changeRating, {
    super.key,
  });

  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  late int rating;

  @override
  void initState() {
    rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          IconButton(
            icon: Icon(
              i < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            onPressed: () {
              setState(() {
                rating = i + 1;
              });
              widget.changeRating(i + 1);
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
          )
      ],
    );
  }
}
