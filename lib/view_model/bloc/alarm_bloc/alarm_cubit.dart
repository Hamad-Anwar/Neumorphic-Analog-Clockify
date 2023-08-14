import 'dart:math';

import 'package:clock_analog/services/alarm_service.dart';
import 'package:clock_analog/view_model/bloc/alarm_bloc/alarm_states.dart';
import 'package:clock_analog/view_model/database_helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/alarm_model.dart';
class AlarmCubit extends Cubit<AlarmStates>{
  AlarmCubit() : super(NoData());
  final DbHelper helper=DbHelper();
  late Future<List<AlarmModel>> list;

  void getData()async{
    helper.getData().then((value) {
      list=Future.value(value);
      emit(HasData());
    });

  }

  void addData(BuildContext context)async{
    var picker=await showTimePicker(context: context,
        initialTime: TimeOfDay.now(),
      helpText: "Set Alarm Time",
    );
    if(picker!=null){
      MyAlarm.setAlarm(picker,context);
    }
  }






  Future<Duration> getDifferenceBetweenCurrentTimeAndSelectedTime(TimeOfDay selectedTime) async {
    final now = DateTime.now();
    final selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    return selectedDateTime.difference(now);
  }

}