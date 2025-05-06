import 'package:drosak_management/Featured/explore/Models/explore_model.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key, required this.items, required this.index});
  final ExploreModel items;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Positioned(
        //   top: MediaQuery.sizeOf(context).height * 0.11,
        //   right: MediaQuery.sizeOf(context).width * 0.34,
        //   child: CustomBoxShadow(),
        // ),
        CustomCard(items: items),
        // Positioned(
        //   top: MediaQuery.sizeOf(context).height * 0.11,
        //   right: MediaQuery.sizeOf(context).width * 0.34,
        //   child: CircleAvatar(
        //     radius: 16,
        //     backgroundColor: AppColor.secondColorBlock,
        //     // backgroundColor: Colors.white,
        //   ),
        // ),
        // Positioned(
        //   top: MediaQuery.sizeOf(context).height * 0.1 + 10,
        //   right: MediaQuery.sizeOf(context).width * 0.34 + 4,
        //   child: CustomNumberItem(index: index),
        // ),
      ],
    );
  }
}
