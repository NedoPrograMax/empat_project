import 'package:empat_app/core/routes.dart';
import 'package:empat_app/models/category.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/data_source.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.read<DataSource>().currentCategory = category.type;
        Navigator.of(context).pushNamed(RouteGenerator.moviesScreen);
      },
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color,
                category.color.withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(2, 2),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              category.type.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
