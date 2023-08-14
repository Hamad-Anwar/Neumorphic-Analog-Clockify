import 'package:flutter/material.dart';

import 'alarm_list.dart';
import 'app_bar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const MyAppBar(),
          Text('Alarm',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.black,
              fontSize: 50
          ),),
          const SizedBox(height: 200,),
          const Expanded(child: AlarmList()),
        ],
      ),
    );
  }
}
