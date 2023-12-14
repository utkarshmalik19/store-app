import 'package:flutter/material.dart';
import 'package:store_app/utils/consts.dart';

class ItemTile extends StatelessWidget {
  final String itemName;
  final String itemDescription;

  const ItemTile(
      {super.key, required this.itemName, required this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        itemName,
        style: AppConstants.bigTextStyle,
      ),
      subtitle: Text(
        itemDescription,
        style: AppConstants.smallTextStyle,
      ),
      leading: Image.asset("assets/images/food.png"),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppConstants.bgColor,side: BorderSide(color: Colors.green)),
        child: Text("Add", style: AppConstants.smallTextStyle,),
        onPressed: () {},
      ),
    );
  }
}
