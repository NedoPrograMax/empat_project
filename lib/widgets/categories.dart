import 'package:empat_app/bloc/app_bloc.dart';
import 'package:empat_app/bloc/app_event.dart';
import 'package:empat_app/bloc/app_state.dart';
import 'package:empat_app/constants.dart';
import 'package:empat_app/models/category.dart';
import 'package:empat_app/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryItem(
            category: categories[index],
            isChosen: index == (state as MainState).chosedId,
            onPressed: () => context.read<AppBloc>().add(
                  EventChooseCategoty(categories[index].type),
                ),
          ),
        ),
      ),
    );
  }
}
