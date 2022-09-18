import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/news_app_secreens/search_Screen.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, const SearchScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changeMode();
                  },
                  icon: const Icon(Icons.dark_mode_rounded))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.business), label: cubit.titles[0]),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.sports), label: cubit.titles[1]),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.science), label: cubit.titles[2]),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.devices_other),
                  label: cubit.titles[3]),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              if (index == 1) {
                NewsCubit.get(context).getSports();
              }
              if (index == 2) {
                NewsCubit.get(context).getScience();
              }
              if (index == 3) {
                NewsCubit.get(context).getTechnology();
              }
              cubit.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
