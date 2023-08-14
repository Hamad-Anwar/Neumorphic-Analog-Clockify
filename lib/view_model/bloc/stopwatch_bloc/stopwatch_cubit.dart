import 'dart:async';

import 'package:clock_analog/view_model/bloc/stopwatch_bloc/stopwatch_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopwatchCubit extends Cubit<StopwatchStates> {
  late Timer _timer;
  int hours = 0;
  int min = 0;
  int sec = 0;
  bool isStarted = false;

  StopwatchCubit() : super(StopSate('00', '00', '00'));

  void startTimer() {
    if (!isStarted) {
      isStarted = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        sec++;
        // Increment the elapsed time

        if (sec == 60) {
          sec = 0;
          min++;
        }
        if (min == 60) {
          min = 0;
          hours++;
        }

        emit(StartSate(
          hours.toString(),
          min.toString(),
          sec.toString(),
        ));
      });
    }
  }

  void pauseTimer() {
    if (isStarted) {
      isStarted = false;
      _timer?.cancel();
      emit(PauseSate(
        hours.toString(),
        min.toString(),
        sec.toString(),
      ));
    }
  }

  void resumeTimer() {
    if (!isStarted) {
      isStarted = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        sec++;
         // Increment the elapsed time

        if (sec == 60) {
          sec = 0;
          min++;
        }
        if (min == 60) {
          min = 0;
          hours++;
        }

        emit(StartSate(
          hours.toString(),
          min.toString(),
          sec.toString(),
        ));
      });
    }
  }

  void stopTimer() {
    isStarted = false;
    sec=0;
    min=0;
    hours=0;
    _timer.cancel(); // Reset elapsed time
    emit(StopSate('00', '00', '00'));
  }
}