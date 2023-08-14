import 'package:clock_analog/view_model/bloc/home%20bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeStates>{
  HomeBloc() : super(TabTwo());

  void changeTab(int index){
    if(index==0){
      emit(TabOne());
    }else if(index==1){
      emit(TabTwo());
    }else if(index==2){
      emit(TabThree());
    }else{
      emit(TabFour());
    }
  }


}