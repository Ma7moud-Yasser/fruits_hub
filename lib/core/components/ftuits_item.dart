import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  // Map<String, String> bestSellerItem ={
  //   'name': 'Banana',
  //   'price': '\$1.00',
  //   'image': ImagesAssets.bestSeller1,
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(ImagesAssets.bestSeller1),
          const SizedBox(height: 8),
          const Text(
            'Banana',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            '\$1.00',
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
