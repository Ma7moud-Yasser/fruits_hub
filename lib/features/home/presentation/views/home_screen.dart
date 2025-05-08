import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/components/custom_home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [SliverToBoxAdapter(child: CustomHomeAppBar())],
        ),
      ),
    );
  }
}
