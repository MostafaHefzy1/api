import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/features/home/logic/home_cubit.dart';
import 'package:project1/features/home/ui/widgets/list_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "List Screen",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          body: cubit.listItemModel == null
              ? const LinearProgressIndicator()
              : ListView.builder(
                  controller: cubit.scrollController,
                  itemBuilder: (context, index) {
                    if (index < cubit.paginationToDoList.length) {
                      return ListItem(
                        itemModel: cubit.paginationToDoList[index],
                      );
                    } else if (cubit.listItemModel!.isNotEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox();
                    }
                  },
                  itemCount: cubit.paginationToDoList.length + 1,
                ),
        );
      },
    );
  }
}
