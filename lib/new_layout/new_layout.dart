import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/changeCubit/cubit.dart';
import 'package:newsapp/componets/componets.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/search_screen.dart';

class NewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App '),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigato(context, SearchScreen());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).changAppMode();
                    },
                    icon: Icon(Icons.brightness_4_rounded))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavbar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        });
  }
}
