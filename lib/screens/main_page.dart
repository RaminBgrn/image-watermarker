import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_water_marker/widgets/grid_view_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: MasonryGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        itemCount: 20,
        padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
        addRepaintBoundaries: true,
        shrinkWrap: true,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return const GridViewItem();
        },
      ),
    );
  }
}
