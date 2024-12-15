import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/features/home/data/models/list_item_model.dart';
import 'package:project1/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<ItemModel>? listItemModel;
  List<ItemModel> paginationToDoList = [];
  void getList(int page) {
    _homeRepository.getList(page).then((value) {
      listItemModel = value;

      paginationToDoList.addAll(listItemModel!);
      log("listItemModel ${listItemModel!.length}");
      log("paginationToDoList ${paginationToDoList!.length}");
      emit(GetListSuccessState());
    }).catchError((error) {
      emit(GetListFailedState());
    });
  }

  final scrollController = ScrollController();
  int page = 1;
  paginationFun() {
    if (listItemModel == null) {
      getList(page);
    }
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        page++;
        getList(page);
      }
    });
  }
}
