import 'package:analog_clock/analog_clock.dart';
import 'package:clock_analog/view_model/bloc/stopwatch_bloc/stopwatch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../res/constants.dart';
import '../../view_model/bloc/stopwatch_bloc/stopwatch_cubit.dart';
import '../common_widget/soft_button.dart';
class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});
  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}
class _StopWatchScreenState extends State<StopWatchScreen> {
  int sec=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/Settings.svg'),
                  CircularSoftButton(
                    radius: 20,
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.pink,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Timer',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.black, fontSize: 40),
                ),
              ),
              const Spacer(),
              BlocConsumer<StopwatchCubit, StopwatchStates>(
                builder: (context, state) {
                  if (state is StartSate) {
                    return Text(
                      '${state.hour}:${state.min}:${state.sec}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 30),
                    );
                  } else if (state is PauseSate) {
                    return Text(
                      '${state.hour}:${state.min}:${state.sec}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 30),
                    );
                  } else if (state is StopSate) {
                    return Text(
                      '${state.hour}:${state.min}:${state.sec}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 30),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
                listener: (context, state) {
                  if(state is PauseSate ){
                    sec=int.parse(state.sec);
                  }
                  if(state is StartSate){
                    sec=int.parse(state.sec);
                  }
                  if(state is StopSate){
                    sec=0;
                  }
                },
              ),
              const Spacer(),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width),
                      gradient: LinearGradient(
                        colors: [shadowColor, lightShadowColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: shadowColor,
                            offset: const Offset(8, 6),
                            blurRadius: 12),
                        BoxShadow(
                            color: lightShadowColor,
                            offset: const Offset(-8, -6),
                            blurRadius: 12),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      bottom: 10,
                      child: BlocConsumer<StopwatchCubit, StopwatchStates>(
                        listener: (context, state) {
                          if(state is StartSate){
                            sec=BlocProvider.of<StopwatchCubit>(context).sec;
                          }
                        },
                        builder: (context, state) {
                          if (state is StartSate) {
                            return AnalogClock(
                              isLive: state is StartSate,
                              hourHandColor: Colors.transparent,
                              minuteHandColor: Colors.transparent,
                              numberColor: Colors.black45,
                              secondHandColor: Colors.pinkAccent,
                              showNumbers: true,
                              showAllNumbers: true,
                              showDigitalClock: false,
                              datetime: DateTime(2023, 1, 0, 0, 0, sec),
                            );
                          } else {
                            return Center(
                              child: AnalogClock(
                                isLive: false,
                                hourHandColor: Colors.transparent,
                                minuteHandColor: Colors.transparent,
                                numberColor: Colors.black45,
                                secondHandColor: Colors.pinkAccent,
                                showNumbers: true,
                                showAllNumbers: true,
                                showDigitalClock: false,
                                datetime: DateTime(2023, 1, 0, 0, 0, sec,),
                              ),
                            );
                          }
                        },
                      )),
                ],
              ),
              const Spacer(),
              BlocConsumer<StopwatchCubit, StopwatchStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is StopSate) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<StopwatchCubit>(context).startTimer();
                      },
                      child: CircularSoftButton(
                        radius: 40,
                        icon: const Icon(Icons.play_arrow),
                      ),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        state is StartSate
                            ? GestureDetector(
                                onTap: () {
                                  BlocProvider.of<StopwatchCubit>(context)
                                      .pauseTimer();
                                },
                                child: CircularSoftButton(
                                  radius: 40,
                                  icon: const Icon(Icons.pause),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  BlocProvider.of<StopwatchCubit>(context)
                                      .resumeTimer();
                                },
                                child: CircularSoftButton(
                                  radius: 40,
                                  icon: const Icon(Icons.play_arrow),
                                ),
                              ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<StopwatchCubit>(context)
                                .stopTimer();
                          },
                          child: CircularSoftButton(
                            radius: 40,
                            icon: const Icon(Icons.stop),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
