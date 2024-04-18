import 'package:flutter/material.dart';

import '../../../../core/general_screens/category_screen.dart';

class CategoryType extends StatelessWidget {
  const CategoryType(
      {super.key, required this.image, required this.categoryName});

  final String image;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                  color: Theme.of(context).colorScheme.surface, width: 5)),
          child: Image.asset(image),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          categoryName,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.secondary,
          ),
        )
      ],
    );
  }
}
