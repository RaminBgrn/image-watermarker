import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_water_marker/utils/colors.dart';
import 'package:image_water_marker/widgets/custom_appbar.dart';
import 'package:image_water_marker/widgets/grid_view_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey[800],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          const CustomAppBar(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(children: [
              const SizedBox(
                height: 60,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return index < 1
                      ? GridViewItem()
                      : SizedBox(
                          width: 220,
                          height: 320,
                          child: DottedBorder(
                            strokeWidth: 1,
                            stackFit: StackFit.expand,
                            borderPadding: const EdgeInsets.all(8),
                            dashPattern: const [18, 20],
                            padding: const EdgeInsets.all(8),
                            color: myGrey[500]!,
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(18),
                            child: Icon(
                              Icons.add_a_photo_rounded,
                              size: 63,
                              color: myGrey[500],
                            ),
                          ),
                        );
                },
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
