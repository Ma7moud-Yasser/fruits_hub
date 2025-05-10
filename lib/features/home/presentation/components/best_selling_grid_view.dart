import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/ftuits_item.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: PaddingManager.symmetric(context: context, vertical: 0),
      sliver: SliverGrid.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return FruitItem();
        },
      ),
    );
  }
}
