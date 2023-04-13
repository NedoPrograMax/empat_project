import 'package:empat_app/state/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          Expanded(
            child: TextField(
              decoration:
                  const InputDecoration(hintText: "Singers, tracks...."),
              onChanged: context.read<SearchCubit>().search,
            ),
          ),
        ],
      ),
    );
  }
}
