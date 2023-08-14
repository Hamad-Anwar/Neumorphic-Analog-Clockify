import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/bloc/alarm_bloc/alarm_cubit.dart';
import '../../common_widget/soft_button.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AlarmCubit>(context).addData(context);
      },
      child: CircularSoftButton(
        radius: 30,
        icon: const Icon(Icons.add,color: Colors.pinkAccent,size: 30,),
      ),
    );
  }
}
