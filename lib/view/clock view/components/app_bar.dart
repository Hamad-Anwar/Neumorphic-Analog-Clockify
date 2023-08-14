import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_widget/soft_button.dart';

class ClockAppBar extends StatelessWidget {
  const ClockAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/icons/Settings.svg'),
          CircularSoftButton(
            radius: 20,
            icon: const Icon(Icons.settings,color: Colors.pink,),
          )
        ],
      ),
    );
  }
}
