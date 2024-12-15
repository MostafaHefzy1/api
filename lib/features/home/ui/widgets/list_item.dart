import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/features/home/data/models/list_item_model.dart';

class ListItem extends StatelessWidget {
  final ItemModel itemModel;

  const ListItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: Image.network(
          "https://tse1.mm.bing.net/th?id=OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH&pid=Api",
        ),
        title: Text(itemModel.title ?? " "),
        subtitle: Text(itemModel.status ?? ""),
      ),
    );
  }
}
