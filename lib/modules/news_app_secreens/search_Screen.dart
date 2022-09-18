import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultInputField(
                  onChange: (value) {
                    cubit.getSearch(value);
                  },
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  label: 'Search',
                  prefixIcon: Icons.search,
                ),
              ),
              Expanded(child: Container(child: newsScreenBuilder(list, isSearch: true))),
            ],
          ),
        );
      },
    );
  }
}
