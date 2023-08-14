import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/bloc/time_bloc/time_bloc.dart';
import '../../../view_model/bloc/time_bloc/time_states.dart';
class TimeText extends StatelessWidget {
  const TimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimeCubit,TimeStates>(
      builder: (context, state) {
        if(state is UpdateTime){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${state.hour}:${state.min}',style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.black54,
              ),),
              RotatedBox(
                quarterTurns: 3,
                child: Text(state.state,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey,
                    fontSize: 17
                ),),
              ),
            ],
          );
        }else{
          return const SizedBox();
        }
      }, listener: (context, state) {

    },);
  }
}
