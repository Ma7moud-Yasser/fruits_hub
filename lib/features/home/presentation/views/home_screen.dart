import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/features/home/presentation/components/custom_home_app_bar.dart';
import 'package:fruits_hub/core/components/custom_search_bar.dart';
import 'package:fruits_hub/features/home/presentation/components/featured_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomHomeAppBar()),
            SliverToBoxAdapter(child: SizedBoxManager.height(context, 16)),
            SliverToBoxAdapter(child: CustomSearchBar()),
            SliverToBoxAdapter(child: SizedBoxManager.height(context, 16)),
            SliverToBoxAdapter(child: FeaturedItem()),
          ],
        ),
      ),
    );
  }
}
