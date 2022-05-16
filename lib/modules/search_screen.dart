import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/componets/componets.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultfromfield(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Search no must be empty';
                      } else {
                        return null;
                      }
                    },
                    label: 'Search',
                    prefix: Icons.search),
              ),
              Expanded(child: articaleBuildItem(list, context))
            ],
          ),
        );
      },
    );
  }
}
