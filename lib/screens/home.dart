import 'package:flutter/material.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey[800],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Stack(children: [
          CustomAppBar(),
        ]),
      ),
    );
  }
}
